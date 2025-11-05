FROM nginx:1.25-alpine
RUN apk add --no-cache bash gettext
WORKDIR /usr/share/nginx/html
COPY nginx/default.conf /etc/nginx/conf.d/default.conf
COPY templates/index.html /tmp/index.html
# Script de entrada: genera index.html con el nombre del host/pod
COPY docker-entrypoint.sh /docker-entrypoint.d/99-generate-index.sh
RUN chmod +x /docker-entrypoint.d/99-generate-index.sh
EXPOSE 80
