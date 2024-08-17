#!/bin/bash
set -x  #debug mode
set -e  #exits the script when there is an error
set -o pipefail  # exits the script when there is a pipefail


df -hT
free -g
nproc
ps -ef | pgrep -i amazon | awk -F" " '{print $2}'    #prints only the pid of the amazon processes.
