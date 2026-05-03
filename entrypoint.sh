#!/bin/sh
set -e

# Inject env vars into the HTML at container startup
SAFE_KEY=$(echo "${OPENROUTER_API_KEY:-}" | sed 's/[&/\]/\\&/g')
SAFE_PIN=$(echo "${SITE_PIN:-}" | sed 's/[&/\]/\\&/g')

sed \
  -e "s|__OPENROUTER_API_KEY__|${SAFE_KEY}|g" \
  -e "s|__SITE_PIN__|${SAFE_PIN}|g" \
  /usr/share/nginx/html/index.html.template \
  > /usr/share/nginx/html/index.html

exec nginx -g 'daemon off;'
