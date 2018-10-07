#!/usr/bin/env bash

timeout=15

# Wait for the other container to start accepting connections
sleep 5

status=$(curl -o /dev/null -L -X GET --connect-timeout $timeout --max-time $timeout -Isw '%{http_code}\n' http://omnidb:8080)

if [[ "$status" -eq "200" ]]; then
  echo 'OmniDb responded with status code 200'
  exit 0
else
  echo "OmniDb did not respond in $timeout seconds"
  exit 1
fi
