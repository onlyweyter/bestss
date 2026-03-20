#!/bin/bash

echo "Random delay..."
sleep $((RANDOM % 20))

echo "Starting TCP proxy..."
socat -T 30 TCP-LISTEN:8080,bind=0.0.0.0,reuseaddr,fork,max-children=1 TCP:dagnam.xyz:4629 &

sleep 8

echo "Check port..."
ss -tuln | grep 8080

echo "Starting Cloudflare tunnel..."
cloudflared tunnel run --token $TUNNEL_TOKEN

echo "Running..."
while true; do sleep 60; done
