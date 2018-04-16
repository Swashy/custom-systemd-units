#!/bin/bash
#source our profile to get an environment
. /root/.bashrc
 
theDate=$(date)
echo "" >> /var/log/lets-encrypt.log
echo "[Start Run]" $theDate >> /var/log/lets-encrypt.log
 
/opt/lets-encrypt/certbot-auto -n --nginx certonly --webroot-path /var/www/html \
-d www.example.com -d example.com --renew-hook "service nginx reload" \
&> /var/log/lets-encrypt.log
