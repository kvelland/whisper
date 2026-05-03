#!/bin/sh
set -e

# Inject OPENROUTER_API_KEY into the HTML at container startup
SAFE_KEY=$(echo "${OPENROUTER_API_KEY:-}" | sed 's/[&/\]/\\&/g')
sed "s|__OPENROUTER_API_KEY__|${SAFE_KEY}|g" \
  /usr/share/nginx/html/index.html.template \
  > /usr/share/nginx/html/index.html

exec nginx -g 'daemon off;'
