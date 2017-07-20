#!/bin/sh

cd test-target-repo
mvn verify -P it -s ../pipeline-repo/tasks/settings.xml -Dtest=GreenFlowTest -Dmaven.repo.local=../m2/rootfs/opt/m2

# change timezone
cp /etc/localtime /etc/localtime.org
ln -sf  /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

BUILD_TIME=`date '+%Y%m%d%H%M%S'`
mkdir -p ../report/green-flow-${BUILD_TIME}

cp -rf target/site/serenity/* ../report/green-flow-${BUILD_TIME}

