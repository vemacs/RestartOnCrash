#!/bin/bash

##Generic Minecraft Crash Detector by vemacs

server_path="/home/nullblock/660"
restart_command="service minecraft restart"
say_command="service minecraft say"

function monitor() {
  while [[ 1 ]]
   do
    server_check
    sleep 5
  done
}

function server_check() {
  cd $server_path/crash-reports/
  lastfile=$(ls -Art | tail -n 1 | grep crash | grep server)
  timestamp=$(stat --printf=%y $server_path/crash-reports/$lastfile | cut -d. -f1 | tr -d '-' | tr -d ':' | tr -d " ")
  secondsDiff=$(( `date '+%Y%m%d%H%M%S'` - $timestamp ))
  if [ $secondsDiff -gt 6 ] 
   then
     ##do nothing
   else
     echo "Crashed! Report: $lastfile"
     eval $say_command "Shit just got real. Server crashed."
     eval $restart_command
  fi
}

monitor