#!/bin/sh

# COLOR_CODE handler
echo "COLOR_CODE=$COLOR_CODE"
envsubst < /default.conf > /etc/nginx/conf.d/default.conf
