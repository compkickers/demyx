#!/bin/bash
# demyx
# https://demyx.sh
set -euo pipefail

docker pull compkickers/code-server:browse
docker pull compkickers/demyx
docker pull compkickers/docker-compose
docker pull compkickers/docker-socket-proxy
docker pull compkickers/logrotate
docker pull compkickers/mariadb
docker pull compkickers/nginx
docker pull compkickers/ssh
docker pull compkickers/traefik
docker pull compkickers/utilities
docker pull compkickers/wordpress
docker pull compkickers/wordpress:cli

echo -e "\n\e[34m[INFO\e[39m] Pinging active server to demyx"
docker run -t --rm compkickers/utilities curl -s "https://demyx.sh/?action=active&token=V1VpdGNPcWNDVlZSUDFQdFBaR0Zhdz09OjrnA1h6ZbDFJ2T6MHOwg3p4" -o /dev/null

echo -e "\n\e[34m[INFO\e[39m] Installing demyx helper"
docker run -t --rm -v /usr/local/bin:/tmp --user=root --privileged --entrypoint=bash demyx/demyx -c 'cp -f /etc/demyx/host.sh /tmp/demyx; chmod +x /tmp/demyx'

demyx
