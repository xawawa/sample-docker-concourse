#!/bin/sh

# test-common を .m2 に追加する
cd test-common-repo
mvn clean dependency:go-offline -s ../pipeline-repo/tasks/settings.xml -Dmaven.repo.local=../m2/rootfs/opt/m2 clean package install

# tarを生成する
cd ../m2
tar -C rootfs -cf rootfs.tar .
mv -u rootfs.tar ../to-push
