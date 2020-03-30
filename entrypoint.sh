#!/bin/sh

goofys -o allow_other --uid `id -u nginx` $BUCKET_NAME /var/www


nginx -g 'daemon off;'
