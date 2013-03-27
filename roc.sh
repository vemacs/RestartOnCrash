#!/bin/bash

##Generic Minecraft Crash Detector by vemacs

server_path='/home/nullblock/660'
restart_command='/etc/init.d/minecraft say "Shit just got real. Restart initiated." && service minecraft restart'
check_seconds=15

function monitor() {
  while [[ 1 ]]
   do
    server_check
    sleep $check_seconds
  done
}

function server_check() {
  cd $server_path/crash-reports/
  lastfile=$(ls -Art | tail -n 1 | grep crash | grep server)
  timestamp=$(stat --printf=%y $server_path/crash-reports/$lastfile | cut -d. -f1 | tr -d '-' | tr -d ':' | tr -d " ")
  secondsDiff=$(( `date '+%Y%m%d%H%M%S'` - $timestamp ))
  if [ $secondsDiff -lt $check_seconds ]
   then
     echo "Crashed! Report: $lastfile"
     eval $restart_command
  fi
}

echo "Starting ROC with directory $server_path!"
monitor