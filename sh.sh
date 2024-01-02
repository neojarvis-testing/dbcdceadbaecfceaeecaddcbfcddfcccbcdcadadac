#!/usr/bin/bash

check_directory_empty() {
    local directory=$1
    local name=$2
    if [ -z "$(ls -A $directory)" ]; then
        echo $2 "-notexists"
    else
        echo $2 "-exists" 
    fi
}
rm -rf /home/coder/project/workspace/Project/screenshot
rm -rf /home/coder/project/workspace/Project/logs
rm -rf /home/coder/project/workspace/Project/reports
rm -rf /home/coder/project/log.log
touch /home/coder/project/log.log
cp /home/coder/project/workspace/selenium/EventHandler.java /home/coder/project/workspace/Project/src/test/java/utils/EventHandler.java
cd /home/coder/project/workspace/Project
mvn -q test
cp /home/coder/project/workspace/selenium/EventHandleDummy.java /home/coder/project/workspace/Project/src/test/java/utils/EventHandler.java
cat /home/coder/project/log.log
logdir="/home/coder/project/workspace/Project/logs"
scrdir="/home/coder/project/workspace/Project/screenshot"
reportsdir="/home/coder/project/workspace/Project/reports"

check_directory_empty $logdir "log";
check_directory_empty $scrdir "scr";
check_directory_empty $reportsdir "report";
