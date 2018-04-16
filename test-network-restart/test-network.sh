#!/bin/bash

nc_result=$(/usr/bin/nc -w 1 -v es1 22 </dev/null &>/dev/null; echo $?)

if [ "$nc_result" -eq 1 ]; then
 second_nc_result=$(/usr/bin/nc -w 1 -v es1 22 </dev/null &>/dev/null; echo $?)
fi

if [ ! -z "$second_nc_result" ]; then
   if [ "$second_nc_result" -eq 1 ]; then
     systemd-cat -p crit echo "ERROR, network test failed!";
     /usr/bin/systemctl restart network
     exit;
   fi
else systemd-cat -p info echo "Networking test successful";
fi
