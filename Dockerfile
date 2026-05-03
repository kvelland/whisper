FROM nginx:alpine
RUN apk add --no-cache bash
COPY index.html /usr/share/nginx/html/index.html.template
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
EXPOSE 80
CMD ["/entrypoint.sh"]
