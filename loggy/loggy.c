#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <stdlib.h>
#include <pthread.h>
#include <stdio.h>
#include <string.h>
#include <mntent.h>

#define BUF_MAX 0x100

char *get_filename_from_path(char *path) {
    return (strrchr(path, '/') ? strrchr(path, '/') + 1 : path);
}

void *loggy_thread(void *loggy_args) {
    char *date = ((char **) loggy_args)[0];
    char *read = ((char **) loggy_args)[1];

    struct stat path_stat;
    stat(read, &path_stat);
    if(!S_ISREG(path_stat.st_mode))
        return NULL;

    char filename[BUF_MAX] = {0x00,};
    sprintf(filename, "/cache/twrp_%s_%s.txt", get_filename_from_path(read), date);

    FILE *read_fp, *write_fp;
    unsigned char buf[BUF_MAX * 0x100] = {0x00,};

    if ((read_fp = fopen(read, "r")) == NULL || (write_fp = fopen(filename, "a+")) == NULL) {
            perror("loggy_fopen()");
            return NULL;
    }

    while (1) {
        if ((fread(buf, BUF_MAX * 0x100, 0x1, read_fp)) < 0 || (fwrite(buf, BUF_MAX * 0x100, 0x1, write_fp)) < 0) {
            perror("loggy_fopen() | loggy_fwrite()");
            return NULL;
        }
        usleep(100000);
    }
    fclose(read_fp);
    fclose(write_fp);
}

int main(int argc, char *argv[]) {
    char date[BUF_MAX] = {0x00,};

    FILE *fp;
    if ((fp = popen("date +%F_%H-%M-%S", "r")) == NULL) {
        perror("main_popen()");
        abort();
    }

    if (fread(date, 0x1, BUF_MAX, fp) <= 0x00) {
        perror("main_fgets()");
        abort();
    }
    pclose(fp);

    /* waiting for /cache mount. */
    int is_cache_mounted = 0;
    while(!is_cache_mounted)
    {
        struct mntent *ent;
        if((fp = setmntent("/proc/mounts", "r")) == NULL) {
            perror("main_setmntent()");
            abort();
        }

        while (NULL != (ent = getmntent(fp))) {
            if(strcmp("/cache", ent->mnt_dir) == 0)
                is_cache_mounted = 1;
        }
        fclose(fp);
        sleep(1);
    }

    pthread_t loggy_thread_t[argc - 1];
    void *loggy_args[argc - 1][2];
    date[strlen(date) - 1] = '\0';

    puts("[*] loggy service successfully started!");
    for (int i = 1; i < argc; i++) {
        loggy_args[i - 1][0] = date;
        loggy_args[i - 1][1] = (void *) argv[i];
        if (pthread_create(&loggy_thread_t[i - 1], NULL, loggy_thread, loggy_args[i - 1])) {
            perror("main_pthread_create()");
            abort();
        }
    }

    for(int i = 0; i < argc - 1; i++) {
        size_t unused_ret __attribute__((unused));
        pthread_join(loggy_thread_t[i], (void **)&unused_ret);
    }
    return 0;
}

