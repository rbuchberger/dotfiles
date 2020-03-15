#!/bin/bash

if [ -f  ~/.config/vdirsyncer/password ]
then
  cat ~/.config/vdirsyncer/password
else
  pass cloud.robert-buchberger.com/calDav_carDav
fi
