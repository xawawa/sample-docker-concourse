#!/bin/sh

cd db-operation-repo

mvn verify -P it -s ../pipeline-repo/tasks/settings.xml -Dtest=DbOperation#greenFlowSetUp -Dmaven.repo.local=../m2/rootfs/opt/m2

# change timezone
cp /etc/localtime /etc/localtime.org
ln -sf  /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
