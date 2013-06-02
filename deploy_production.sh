#!/bin/bash

cd $(dirname "${BASH_SOURCE[0]}")

python3 build3.py "http://website.url/" 123
#where 123 is yandex search id obtainable on http://site.yandex.ru/searches/new/

HOST="12.34.56.78" #remote ftp id
USERPASS=$(cat /home/graf/incoming/esk_pass) #user in format user:password
LCD="$(pwd)/_site"
RCD="/www/ubuntu"
lftp -c "set ftp:list-options -a;
set ftp:ssl-allow off
open ftp://$USERPASS@$HOST; 
lcd $LCD;
cd $RCD;
mirror --reverse \
       --only-newer \
       --delete \
       --ignore-time \
       --use-cache \
       --verbose"

#Clear cloudflare cache
# curl https://www.cloudflare.com/api_json.html \
#   -d 'a=fpurge_ts' \
#   -d 'tkn=1234' \
#   -d 'email=user@email.com' \
#   -d 'z=website.url' \
#   -d 'v=1'