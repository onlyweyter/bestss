#!/bin/bash

echo "Buka port 8080 dummy..."

while true; do
  nc -l -p 8080
done &
  
sleep 5

echo "Cek port..."
ss -tuln | grep 8080 || echo "❌ PORT TETAP GA KEBUKA"

echo "Start cloudflared..."
cloudflared tunnel run --token $TUNNEL_TOKEN
