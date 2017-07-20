#!/bin/sh

cd otdps-cc-api-repo
mvn verify -P it -s ../pipeline-repo/tasks/settings.xml -Dtest=SerenityApiTest -Dmaven.repo.local=../m2/rootfs/opt/m2

# change timezone
cp /etc/localtime /etc/localtime.org
ln -sf  /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

BUILD_TIME=`date '+%Y%m%d%H%M%S'`
mkdir -p ../report/otdps-cc-api-${BUILD_TIME}

cp -rf target/site/serenity/* ../report/otdps-cc-api-${BUILD_TIME}

