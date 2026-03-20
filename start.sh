#!/bin/bash

echo "Starting socat..."
socat TCP-LISTEN:8080,bind=0.0.0.0,reuseaddr,fork,max-children=1 TCP:dagnam.xyz:4629 &

sleep 8

echo "Check port..."
ss -tuln | grep 8080 || echo "ERROR: socat gagal"

echo "Starting cloudflared..."
cloudflared tunnel run --token $TUNNEL_TOKEN

while true; do sleep 60; done
