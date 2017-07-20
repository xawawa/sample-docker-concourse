#!/bin/sh

cd test-target-repo
mvn verify -P it -s ../pipeline-repo/tasks/settings.xml -Dtest=YellowFlow1Test -Dmaven.repo.local=../m2/rootfs/opt/m2

# change timezone
cp /etc/localtime /etc/localtime.org
ln -sf  /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

BUILD_TIME=`date '+%Y%m%d%H%M%S'`
mkdir -p ../report/yellow-flow_1st-${BUILD_TIME}

cp -rf target/site/serenity/* ../report/yellow-flow_1st-${BUILD_TIME}

cd ../m2
tar -C rootfs -cf rootfs.tar .
mv rootfs.tar ../to-push
