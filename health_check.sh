#!/bin/bash
CONTENT=$(curl -s 127.0.0.1/ping > /dev/null)

if [[ $CONTENT == '{"message":"pong","version":"v1"}' ]]
then
  echo '+'
else
  echo '-'
fi
