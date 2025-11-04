#!/bin/sh
set -eu
: "${HOSTNAME:=unknown}"
: "${POD_NAME:=$HOSTNAME}"
# Renderiza index.html con variables de entorno
envsubst '${HOSTNAME} ${POD_NAME}' < /tmp/index.html > /usr/share/nginx/html/index.html
