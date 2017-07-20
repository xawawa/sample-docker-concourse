#!/bin/sh

if [ "$1" == "init" ]; then
    mkdir -p ./m2/rootfs/opt/m2
fi

cd test-target-repo
mvn clean dependency:go-offline -s ../pipeline-repo/tasks/settings.xml -Dmaven.repo.local=../m2/rootfs/opt/m2 -DskipTests=true clean package install test site
cd ../m2
tar -C rootfs -cf rootfs.tar .
mv rootfs.tar ../to-push
