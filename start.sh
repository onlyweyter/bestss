#!/bin/bash

echo "Install socat kalau belum ada..."
which socat || (apt update && apt install -y socat)

echo "Random delay..."
sleep $((RANDOM % 15))

echo "Test koneksi ke target..."
nc -zv dagnam.xyz 4629 || echo "WARNING: target tidak bisa diakses"

echo "Starting socat..."
socat -d -d TCP-LISTEN:8080,bind=0.0.0.0,reuseaddr,fork,max-children=1 TCP:dagnam.xyz:4629 &

sleep 5

echo "Cek port 8080..."
ss -tuln | grep 8080 || (echo "❌ ERROR: socat gagal listen" && exit 1)

echo "Starting cloudflared..."
cloudflared tunnel run --token $TUNNEL_TOKEN

echo "Running..."
while true; do sleep 60; done
