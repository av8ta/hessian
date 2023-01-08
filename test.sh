#!/bin/bash
# shellcheck disable=SC2059

main() {

  Files=$(find . -name '*test.gr')
  printerr "\x1b[36m\nRunning tests in *.test.gr files\x1b[0m\n"
  echo "$Files"

  ./clean.sh

  Passed=0
  Failed=0

  for f in $Files; do
    test "$f"
  done
  # test "./test.gr"

  echo
  echo

  if [ "$Failed" = 0 ]; then
    printerr "\x1b[32m=============================\x1b[0m\n"
    printerr " ✅ \x1b[32mAll %s test files passed.\x1b[0m\n" "$Passed"
    printerr "\x1b[32m=============================\x1b[0m\n"
    ./clean.sh
    exit 0

  else
    printerr "\x1b[31m=========================\x1b[0m\n"
    printerr " ✅ \x1b[32m%s test files passed.\x1b[0m\n" "$Passed"
    printerr " ❌ \x1b[41m%s test files failed.\x1b[0m\n" "$Failed"
    printerr "\x1b[31m=========================\x1b[0m\n"
    ./clean.sh
    exit 1
  fi
}

test() {
  printerr "\x1b[36m\n$  grain %s\x1b[0m" "$1"
  if ! grain "$1"; then
    printerr "\n❌ \x1b[41mTests in %s failed.\x1b[0m\n" "$1"
    Failed=$(("$Failed" + 1))
  else
    printerr "\n✅ \x1b[42mTests in %s passed.\x1b[0m\n" "$1"
    Passed=$(("$Passed" + 1))
  fi
}

echoerr() { printf "\n%s" "$*" >&2; }
printerr() { printf "$1" "$2" >&2; }

main
