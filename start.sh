#!/bin/bash

echo "Starting TCP proxy..."

socat -T 30 TCP-LISTEN:8080,reuseaddr,fork,max-children=2 TCP:dagnam.xyz:4629 &

sleep 5

echo "Starting Cloudflare tunnel..."

cloudflared tunnel run --token $TUNNEL_TOKEN

echo "Running..."
