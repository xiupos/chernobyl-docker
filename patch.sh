#!/bin/bash

array=`find /root/.wine32/drive_c/users/root/AppData/Apps/2.0/ -name "chernobyl04.ICD"`
patch=/chernobyl/chernobyl04.ICD

for origin in $array; do
  cp $patch $origin
done
