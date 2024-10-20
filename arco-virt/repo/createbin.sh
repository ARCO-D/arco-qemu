#!/bin/bash
cd bin
eval `busybox --list | awk -v prefix="$B" '{
  for (i=1; i<=NF; i++) {
    if(length($i) > 0) {
      printf "ln -s busybox %s;", $i
    }
  }
}'`

