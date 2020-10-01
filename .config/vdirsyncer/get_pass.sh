#!/bin/bash

if [ -f  ~/.config/vdirsyncer/password ]
then
  cat ~/.config/vdirsyncer/password
else
  pass next.buchberger.cloud/caldav
fi
