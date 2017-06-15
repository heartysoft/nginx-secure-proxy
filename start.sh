#!/usr/bin/env sh

# Tell nginx the address and port of the service to proxy to
sed -i "s/{{TARGET_SERVICE}}/${TARGET_SERVICE}/g;" /etc/nginx/nginx.conf

echo "Starting nginx..."
nginx -g 'daemon off;'