#!/bin/bash

echo "Test port 8080..."
nc -l -p 8080 &

sleep 5

echo "Start cloudflared..."
cloudflared tunnel run --token $TUNNEL_TOKEN
