#! /bin/bash

ping_wait buchberger.cloud 10 10

if [ $? == 0 ]; then
  vdirsyncer sync
else
  echo 'No connection to server.'
  exit 1
fi
