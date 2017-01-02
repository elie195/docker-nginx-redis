#!/bin/bash

#/bin/sed -i "s/DBIP/${DB_PORT_6379_TCP_ADDR}/" /etc/nginx/rewrites/new_rewrites.lua
#cat /etc/nginx/rewrites/new_rewrites.lua
echo "IGNORE_RESOLVCONF=yes" >> /etc/default/dnsmasq
echo "DNSMASQ_OPTS=\"-q\"" >> /etc/default/dnsmasq
service dnsmasq restart
/usr/local/openresty/bin/openresty -g 'daemon off;'
