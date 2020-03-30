#!/bin/sh

if [ -z $BUCKET_NAME ] || [ -z $AWS_ACCESS_KEY_ID ] || [ -z $AWS_SECRET_ACCESS_KEY ] 
then
  echo 'Environment Variables AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY and BUCKET_NAME must be set';
  exit 1;
fi

goofys -o allow_other --uid `id -u nginx` $BUCKET_NAME /var/www

nginx -g 'daemon off;'
