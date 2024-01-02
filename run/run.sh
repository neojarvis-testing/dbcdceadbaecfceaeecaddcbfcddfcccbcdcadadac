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

log_file="/home/coder/project/workspace/Project/log.log"

# Redirect all output to the log file
exec > >(tee -a $log_file) 2>&1

# Remove existing directories
rm -rf /home/coder/project/workspace/Project/screenshot
rm -rf /home/coder/project/workspace/Project/logs
rm -rf /home/coder/project/workspace/Project/reports
rm -rf /home/coder/project/log.log

# Create an empty log file
touch $log_file

# Copy Java file
cp /home/coder/project/workspace/selenium/EventHandler.java /home/coder/project/workspace/Project/src/test/java/utils/EventHandler.java

# Navigate to the project directory
cd /home/coder/project/workspace/Project

# Run Maven test
mvn -q test

# Copy another Java file
cp /home/coder/project/workspace/selenium/EventHandleDummy.java /home/coder/project/workspace/Project/src/test/java/utils/EventHandler.java

# Define directories
logdir="/home/coder/project/workspace/Project/logs"
scrdir="/home/coder/project/workspace/Project/screenshot"
reportsdir="/home/coder/project/workspace/Project/reports"

# Check and print the status of directories
check_directory_empty $logdir "log"
check_directory_empty $scrdir "scr"
check_directory_empty $reportsdir "report"
