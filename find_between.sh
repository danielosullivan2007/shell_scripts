#!/bin/bash
#This is a config file

lower=$1
upper=$2

if [ "$1" = "" ]; then
  read -p "Enter lower file size in MB:" lower
fi

if [ "$1" = "" ]; then
  read -p "Enter upper file size in MB:" upper
fi

#echo $lower
find . -maxdepth 1 -size +"$lower"M -size -"$upper"M