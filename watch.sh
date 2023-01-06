#!/bin/bash
# https://stackoverflow.com/a/22885210 thanks!

watched_files=$(find . -name '*.gr')

if [ -z "$watched_files" ]; then
  echo "Nothing to watch, abort"
  exit
else
  printf "watching: \n%s" "$watched_files"
fi

previous_checksum="dummy"
while true; do
  checksum=$(md5sum $watched_files | md5sum) # use `md5` on Mac, in linux it's `md5sum`
  if [ "$checksum" != "$previous_checksum" ]; then
    ./test.sh
  fi
  previous_checksum="$checksum"
  sleep 1
done
