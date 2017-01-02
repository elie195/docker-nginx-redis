FROM openresty/openresty:trusty 

RUN apt-get update; apt-get install -y --force-yes apt-utils lua-nginx-redis dnsmasq
ADD conf.d/ /usr/local/openresty/nginx/conf
ADD ./redis.lua /usr/local/openresty/nginx/include.d/redis.lua
ADD ./rewrites.lua /etc/nginx/rewrites/new_rewrites.lua
ADD ./start.sh /tmp/start.sh
RUN echo "\n\n# Docker extra config \nuser=root\naddn-hosts=/etc/hosts\n" >> /etc/dnsmasq.conf

WORKDIR /usr/local/openresty

ENTRYPOINT ["/bin/bash","/tmp/start.sh"]
#ENTRYPOINT ["/usr/local/openresty/bin/openresty", "-g", "daemon off;"]
