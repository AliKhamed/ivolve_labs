#!/bin/bash
SUB='192.168.1'
for IP in {0..255}; do
  if ping -c 1 ${SUB}.${IP} > /dev/null 2>&1; then
    echo "Server ${SUB}.${IP} is up and running."
  else
    echo "Server ${SUB}.${IP} is unreachable"
  fi
done
