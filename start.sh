#!/usr/bin/env sh

# Tell nginx the address and port of the service to proxy to
sed -i "s/{{TARGET_SERVICE}}/${TARGET_SERVICE}/g;" /etc/nginx/nginx.conf

if [ "x$USE_SELF_SIGNED_CERT" != "x" ]; then
  echo "Using self signed certificates as USE_SELF_SIGNED_CERT is set."
  export DO_NOT_VERIFY_SSL_CLIENT="1"
  mkdir -p /etc/nginx/certs
  cp /self-signed-cert/* /etc/nginx/certs/ 
fi

if [ "x$DO_NOT_VERIFY_SSL_CLIENT" != "x" ]; then
  sed -i "/.*ssl_verify_client.*/d" /etc/nginx/nginx.conf
fi

echo "Starting nginx..."
nginx -g 'daemon off;'
