#!/bin/bash

echo "Starting socat (debug)..."
socat -d -d TCP-LISTEN:8080,bind=0.0.0.0,reuseaddr,fork,max-children=1 TCP:dagnam.xyz:4629 &

sleep 5

echo "Check port..."
ss -tuln | grep 8080 || echo "PORT 8080 NOT LISTENING ❌"

echo "Starting cloudflared..."
cloudflared tunnel run --token $TUNNEL_TOKEN
