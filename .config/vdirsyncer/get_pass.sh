#!/bin/bash

if [ -f  ~/.config/vdirsyncer/password ]
then
  cat ~/.config/vdirsyncer/password
else
  pass dav.buchberger.cloud/robert
fi
