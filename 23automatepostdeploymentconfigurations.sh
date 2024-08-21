#!/bin/bash

function sethostname(){
        echo "what hostname do you wanna set?"
        read hostname
        hostnamectl set-hostname $hostname
        echo "hostname has been set to:"
        hostname
        
}


function subscribe(){
        subscription-manager register --org <org>  --activationkey <activation key> --force
        echo "vm has been subscribed to redhat"
        
}


function update(){
        yum update -y
        echo "update haas been completed"
}


function installsentinelone(){
        #we need sentinel rpm file on the server first
        #assume sentinel rppm file is present on /var/tmp
        cd /var/tmp
        rpm -i  --nodigest SentinelAgent-Linux-22-2-2-2-x86-64-release.rpm
        /opt/sentinelone/bin/sentinelctl management token set <token for sentinel one>
        /opt/sentinelone/bin/sentinelctl control start
        systemctl status sentinelone.service
        echo "Sentinel one has been installed service is running"
}


function domainjoin(){
        yum install samba-common-tools realmd oddjob oddjob-mkhomedir sssd adcli krb5-workstation
        cat /etc/os-release
        realm list
        realm join -v -- user=adminid@DOMAINNAMELOCAL
        realm list
        echo "Server has been domain joined"
        #we need to make some changes to sssd file.set the value of usefullyqualifiednames to false. 
        systemctl restart sssd
}

function addLAgroupandglobaladmingrouptorealm(){
        echo "whats the group for dcs members?"
        read a
        echo "whats the group for server owners?"
        read b
        realm permit -g "$a"
        realm permit -g "$b"
}



function snmpconfiguration(){
echo "installing snmp related packages"
sleep 5
yum install net-snmp net-snmp-libs  net-snmp-agent-libs  net-snmp-utils
echo "creating snmpv3 user"
sleep 5
net-snmp-create-v3-user  -ro  -a SHA  -x AES  -A <password for username>    <username>
echo "starting and enabling snmpd service"
sleep 5
systemctl start snmpd.service
systemctl enable snmpd.service

snmpwalk  -v3  -u <username>  -A  <password for username> -a SHA -c public -I authNoPriv

#localhost 1.3.6.1.4.1.2021.4.3
#netstat -na | grep :161
#netstat -tulnp | grep LISTEN | grep :161
#netstat -tulnp | grep LISTEN | grep :22
echo "adding the ports to firewall"
sleep 5
firewall-cmd  --add-port=161/tcp 
firewall-cmd   --add-port=161/udp
#netstat -na | grep :161
systemctl restart snmpd
systemctl status snmpd
#netstat -na | grep :161

}

echo "do you wanna set the hostname?"
read var1
if [ "$var1" = "yes" ]
then
sethostname
fi


echo "do you wanna subscribe to redhat?"
read var2
if [ "$var2" = "yes" ]
then
subscribe
fi

echo "do you wanna update the vm??"
read var3
if [ "$var3" = "yes" ]
then
update
fi

echo "do you want to install the sentinel one ?"
read var4
if [ "$var4" = "yes" ]
then
installsentinelone
fi

echo " echo do you wanna join the server to domain?"
read var5
if [ "$var5" = "yes" ]
then
domainjoin
fi

echo "do you wanna provide the access to dcs members as well as server owners?"
read var6
if [ "$var6" = "yes" ]
then
addLAgroupandglobaladmingrouptorealm
fi

echo "do you wanna work on snmp v3 configuration?"
read var7
if [ "$var7" = "yes" ]
then
snmpconfiguration
fi
