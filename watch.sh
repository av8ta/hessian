#!/bin/bash
# https://stackoverflow.com/a/22885210 thanks!

# ./watch.sh to watch all *.test.gr and *.gr files
#     - runs all tests in test.sh
# ./watch.sh path/to/test/to/run.test.gr

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
    if [ "$1" ]; then
      grain "$1"
      ret=$?
      # echo "Command exited with $ret"
      if [ $ret -ne 0 ]; then
        echo "Failed. Restarting test"
        continue
      fi
    else
      ./test.sh
    fi
  fi
  previous_checksum="$checksum"
  sleep 1
done
