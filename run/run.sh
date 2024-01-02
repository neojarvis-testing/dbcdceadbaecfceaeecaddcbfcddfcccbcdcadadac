#!/bin/bash

# Remove redundant log file
rm -rf /home/coder/project/log.log

# Set log file path
log="/home/coder/projects/log.log"

# Function to check if a directory is empty
check_directory_empty() {
    local directory=$1
    local name=$2
    if [ -z "$(ls -A $directory)" ]; then
        echo $name "-notexists"
    else
        echo $name "-exists" 
    fi
}

# Clean directories
rm -rf /home/coder/project/workspace/Project/screenshot
rm -rf /home/coder/project/workspace/Project/logs
rm -rf /home/coder/project/workspace/Project/reports

# Copy files
cp /home/coder/project/workspace/selenium/EventHandler.java /home/coder/project/workspace/Project/src/test/java/utils/EventHandler.java

# Navigate to the project directory
cd /home/coder/project/workspace/Project

# Run Maven test and redirect output to the log file
mvn -q test 

# Copy another file, possibly overwriting the previous one
cp /home/coder/project/workspace/selenium/EventHandleDummy.java /home/coder/project/workspace/Project/src/test/java/utils/EventHandler.java

# Set directory paths
logdir="/home/coder/project/workspace/Project/logs"
scrdir="/home/coder/project/workspace/Project/screenshot"
reportsdir="/home/coder/project/workspace/Project/reports"

# Check directory emptiness and append results to the log file
check_directory_empty $logdir "log" >> $log
check_directory_empty $scrdir "scr"  >> $log
check_directory_empty $reportsdir "report"  >> $log
