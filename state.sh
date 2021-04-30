#!/bin/bash

disk=$(df -h | grep -E "/$" | sed -E "s/.*(..%).*/\1/")
ram=$(free -g | head -n 2 | tail -n 1)
ramTot=$(echo $ram | cut -d ' ' -f 2)
ramUsed=$(echo $ram | cut -d ' ' -f 3)
ip=$(ip a s $(ip r | head -n 1 | cut -d' ' -f 5) | head -n 3 | tail -1 | sed -E 's/.*inet (.*\/[0-9]*).*/\1/')
router=$(ip r | head -n 1 | cut -d' ' -f 3)

echo Disk space / : $disk
echo Total RAM : $ramTot Gio
echo Used RAM : $ramUsed Gio
echo IP Adress : $ip
echo IP router : $router
