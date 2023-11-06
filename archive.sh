#!/bin/bash

while getopts 'p:' OPTION; do
  case "$OPTION" in

    p)
      pattern="$OPTARG"

      ;;
    ?)
      echo "script usage: $(basename \$0) [-p regex pattern]" >&2
      exit 1
      ;;
  esac
done
shift "$(($OPTIND -1))"


if [ -z "$pattern" ]; then #|| [ -z "$user" ] for extra flags
    echo 'Missing -p flag: add pattern' >&2
    exit 1
fi



files=$(find . -maxdepth 1 -name "$pattern")
if [ "$files" = "" ]; then
    echo "No files matching pattern $pattern"
    exit 1
fi
echo "Found files: $files"


read -p "Do you want to Archive these files? y/n:   " archive
if [ "$archive" = "y" ]; then
    mkdir -p ./Archive/
    find . -maxdepth 1 -name "$pattern" -exec mv {} ./Archive/ \;
    echo "Moved files"
else 
    echo "Files not moved"
fi