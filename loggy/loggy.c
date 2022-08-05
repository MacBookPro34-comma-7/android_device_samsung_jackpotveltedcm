#include <unistd.h>
#include <stdlib.h>
#include <pthread.h>
#include <stdio.h>
#include <string.h>

#define BUF_MAX 0x100

char *get_filename_from_path(char *path) {
    return (strrchr(path, '/') ? strrchr(path, '/') + 1 : path);
}

void *loggy_thread(void *loggy_args) {
    char *date = ((char **) loggy_args)[0];
    char *read = ((char **) loggy_args)[1];

    char filename[BUF_MAX] = {0x00,};
    sprintf(filename, "/cache/%s_%s.txt", get_filename_from_path(read), date);

    FILE *read_fp, *write_fp;
    unsigned char buf[BUF_MAX] = {0x00,};

    while (1) {
        if ((read_fp = fopen(read, "r")) == NULL || (write_fp = fopen(filename, "a+")) == NULL) {
            perror("loggy_fopen()");
            return NULL;
        }

        fread(buf, BUF_MAX, 0x1, read_fp);
        fwrite(buf, BUF_MAX, 0x1, write_fp);
        usleep(250000);

        fclose(read_fp);
        fclose(write_fp);
    }
}

static const char log_path[][BUF_MAX] = {"/proc/kmsg", "/proc/last_kmsg"};

int main() {
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

    pthread_t loggy_thread_t;
    void *loggy_args[2];

    date[strlen(date) - 1] = '\0';
    loggy_args[0] = date;

    for (int i = 0; i < (int) (sizeof(log_path) / BUF_MAX); i++) {
        loggy_args[1] = (void *) log_path[i];
        if (pthread_create(&loggy_thread_t, NULL, loggy_thread, loggy_args)) {
            perror("main_pthread_create()");
            abort();
        }
        pthread_join(loggy_thread_t, loggy_args[1]);
    }

    return 0;
}

