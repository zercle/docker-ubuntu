#!/usr/bin/env bash

openssl dhparam -dsaparam -out /etc/ssl/dhparam.pem 4096

service ssh restart
service rsyslog restart
service cron restart

tail -f /dev/null

exit $?
