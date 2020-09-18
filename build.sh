#!/bin/sh

# WordPressの展開
if [ ! -e ./wordpress ]; then
  curl -O https://ja.wordpress.org/latest-ja.zip
  unzip latest-ja.zip
  rm latest-ja.zip
fi
docker-compose up
