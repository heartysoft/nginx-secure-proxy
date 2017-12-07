#!/usr/bin/env sh

# Tell nginx the address and port of the service to proxy to
sed -i "s/{{TARGET_SERVICE}}/${TARGET_SERVICE}/g;" /etc/nginx/nginx.conf

if [ "x$USE_SELF_SIGNED_CERT" != "x" ]; then
  echo "Using self signed certificates as USE_SELF_SIGNED_CERT is set."
  mkdir -p /etc/nginx/certs
  cp /self-signed-cert/* /etc/nginx/certs/ 
fi

echo "Starting nginx..."
nginx -g 'daemon off;'
