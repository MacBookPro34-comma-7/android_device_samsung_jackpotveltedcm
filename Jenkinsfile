pipeline {
    agent {
        label 'Linux-TWRP-Builder'
    }
    stages {
        stage('Prepare') {
            steps {
                dir("twrp") {
                    sh 'rm -rf bootable/recovery && git clone https://github.com/TeamWin/android_bootable_recovery -b android-9.0 bootable/recovery'
                    sh 'git clone https://github.com/MacBookPro34-comma-7/android_device_samsung_jackpotveltedcm.git device/samsung/jackpotveltedcm'
                    sh 'git clone https://github.com/MacBookPro34-comma-7/android_kernel_samsung_jackpotlte.git kernel/samsung/jackpotveltedcm'
                }
            }
        }

        stage('Build') {
            steps {
                dir("twrp") {
                    sh 'export ALLOW_MISSING_DEPENDENCIES=true'
                    sh 'source build/envsetup.sh && lunch omni_jackpotveltedcm-eng && make -j$(nproc --all) recoveryimage'
                }
            }
        }

        stage('Deploy') {
            steps {
                sh 'export version=$(cat bootable/recovery/variables.h | grep "define TW_MAIN_VERSION_STR" | cut -d \'"\' -f2)'
                sh 'cp $HOME/twrp/out/target/product/jackpotveltedcm/recovery.img $HOME/twrp/TWRP-$version-jackpotveltedcm-$(date +"%Y%m%d")-Unofficial.img'
                archiveArtifacts artifacts: '$HOME/twrp/*.img', fingerprint: true
            }
        }
    }
}
