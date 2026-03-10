#!/bin/bash

HOST=$(cat hostname.txt)

echo "Starting TCP proxy..."

socat TCP-LISTEN:443,fork TCP:dagnam.xyz:4629 &

echo "Starting Cloudflare tunnel..."

cloudflared tunnel \
--no-autoupdate \
--url tcp://127.0.0.1:443 \
--hostname $HOST
