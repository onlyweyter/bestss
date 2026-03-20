#!/bin/bash

echo "Starting socat..."
socat TCP-LISTEN:3306,bind=0.0.0.0,reuseaddr,fork,max-children=1 TCP:dagnam.xyz:4629 > /dev/null 2>&1 &

sleep 5

echo "Test port 3306..."
nc -zv localhost 3306 || echo "❌ PORT 3306 TIDAK TERBUKA"

echo "Starting cloudflared..."
cloudflared tunnel run --token $TUNNEL_TOKEN > /dev/null 2>&1

while true; do sleep 60; done
