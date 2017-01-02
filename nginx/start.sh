#!/bin/bash

echo "IGNORE_RESOLVCONF=yes" >> /etc/default/dnsmasq
echo "DNSMASQ_OPTS=\"-q\"" >> /etc/default/dnsmasq
service dnsmasq restart
/usr/local/openresty/bin/openresty -g 'daemon off;'
