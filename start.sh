#!/bin/bash

echo "Starting socat..."
socat TCP-LISTEN:8080,bind=0.0.0.0,reuseaddr,fork,max-children=1 TCP:dagnam.xyz:4629 > /dev/null 2>&1 &

sleep 5

echo "Test port 8080..."
nc -zv localhost 8080 || echo "❌ PORT 8080 TIDAK TERBUKA"

echo "Starting cloudflared..."
cloudflared tunnel run --token $TUNNEL_TOKEN > /dev/null 2>&1

while true; do sleep 60; done
