log= "/home/coder/project/workspace/Project/log.log"

check_directory_empty() {
    local directory=$1
    local name=$2
    if [ -z "$(ls -A $directory)" ]; then
        echo $2 "-notexists"
    else
        echo $2 "-exists" 
    fi
}

logdir="/home/coder/project/workspace/Project/logs"
scrdir="/home/coder/project/workspace/Project/screenshot"
reportsdir="/home/coder/project/workspace/Project/reports"

check_directory_empty $logdir "log" > $log;
check_directory_empty $scrdir "scr"  > $log;
check_directory_empty $reportsdir "report"  > $log;
