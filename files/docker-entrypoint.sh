#!/usr/bin/env bash

service ssh restart
service rsyslog restart
service cron restart

tail -f /dev/null

exit $?
