#!/bin/bash

echo "IGNORE_RESOLVCONF=yes" >> /etc/default/dnsmasq
echo "DNSMASQ_OPTS=\"-q\"" >> /etc/default/dnsmasq
service dnsmasq restart

#Populate redis
(cat /tmp/redis.txt; sleep 5) | nc db 6379 > /dev/null

/usr/local/openresty/bin/openresty -g 'daemon off;'
