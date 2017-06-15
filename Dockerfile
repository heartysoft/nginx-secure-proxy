FROM nginx:1.12.0-alpine
LABEL maintainer "luis@bigcente.ch"

ADD config/nginx.conf /etc/nginx/nginx.conf
ADD start.sh /usr/bin/start.sh
RUN chmod +x /usr/bin/start.sh

CMD /usr/bin/start.sh
