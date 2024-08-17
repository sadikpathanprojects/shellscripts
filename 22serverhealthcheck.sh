#!/bin/bash


D=`date +”%m-%d_%H-%M”`
Report=/test/report/Server_Health.$D

# *** Email for notifications ***
EMAIL=”tushar.jadhav@abc.com”

echo “############################################
Health Check Report (CPU,Process,Disk Usage, Memory)
############################################Hostname : `hostname`
Kernel Version : `uname -mrs`
Uptime : `uptime | awk ‘{gsub (“,”,””);print $3}’`
Last Reboot Time : `who -b | awk ‘{print $3,$4}’`
Load Average : `uptime | awk -F’[!^a-z,]*’ ‘{ gsub(“[:]”,””);print $6 }’ | tr -d “ “`
CPU Usage : `top -bn2 -d1 | awk ‘/^top/{i++}i==2’ | awk -F ‘[!a-z,]*’ ‘NR==3 { gsub (“[%]”,””);print 100-$6"%”}’`
IO Wait : `top -bn2 -d1 | awk ‘/^top/{i++}i==2’ | awk -F ‘[!a-z,]*’ ‘NR==3 { gsub (“[%]”,””);print $7"%”}’| tr -d “ “`” >> $Report
echo “” >> $Report
echo “*****************************************************************
Health Status
******************************************************************” >> $Report
ncpu=$(grep “model name” /proc/cpuinfo | wc -l) >> $Report
echo “Number of cpu : $ncpu” >> $Report
echo “Health Status : `uptime | awk -F’[!^a-z,]*’ ‘{ gsub(“[:]”,””);print $6 }’| awk ‘{ if ($1>$ncpu+1) print “Unhealthy”;else print “Normal”}’` “ >> $Report
echo “” >> $Report
echo “******************************************************************
Process
*******************************************************************
=> Top CPU using process/application
`ps -eo pid,ppid,cmd,%mem,%cpu — sort=-%mem | head `
— — — — — — — — — — — — — — — — — — — — — — — — — — — — — —
=> Top memory using processs/application
` ps -A — sort -rss -o pid,comm,pmem | head | column -t`” >> $Report
echo “” >> $Report
echo “*****************************************************************
Disk Usage && Disk Status
******************************************************************” >> $Report
echo “`df -h | egrep -iv ‘tmpfs|filesystem|none|udev’ | awk ‘{print $1,$6,$4”free”,$3"used”}{ gsub (“[%]”,””);if ($5>95)print “Unheathy”;else if ($5>90) print “Caution”; else print “Normal”}’ | sed ‘N;s/\n/ /’ | column -t`” >> $Report
— — — — — — — — — — — — — — — — — — — — — — — — — > > $Report
echo “” >> $Report
df -h >> $Report
echo “” >> $Report
echo “****************************************************************
Memory
*****************************************************************
=> Physical Memory” >> $Report
totmem=` free -m | awk ‘NR==2 {printf “%2.2f\n”, $2/1024}’`
usemem=`free -m | awk ‘NR==3 {printf “%2.2f\n”, $3/1024}’`
freemem=`free -m | awk ‘NR==3 {printf “%2.2f\n”, $4/1024}’`
freeper=$(echo “$freemem * 100/$totmem” | bc)
echo -e “Total\tUsed\tFree\t%Free
${totmem}GB\t${usemem}GB \t${freemem}GB\t${freeper}%” >> $Report
echo “” >> $Report
echo “=> Swap Memory” >> $Report
totswap=`free -m | awk ‘/Swap/{printf “%2.2f\n”, $2/1024}’`

totswap=`free -m | awk ‘/Swap/{printf “%2.2f\n”, $2/1024}’`
useswap=`free -m | awk ‘/Swap/{printf “%2.2f\n”, $3/1024}’`
freeswap=`free -m | awk ‘/Swap/{printf “%2.2f\n”, $4/1024}’`
freeper=$(echo “$freeswap * 100/$totswap” | bc)
echo -e “Total\tUsed\tFree\t%Free
${totswap}GB\t${useswap}GB \t${freeswap}GB\t${freeper}%” >> $Report

cat “$Report” | mail -s “Server Health check Report” $EMAIL

************************** END *********
