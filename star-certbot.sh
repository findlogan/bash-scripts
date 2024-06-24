#!/bin/bash
if [ -n "$1" ]; then
  sudo certbot certonly --manual --preferred-challenges dns -d "$1"
else
  sudo certbot certonly --manual --preferred-challenges dns
fi
