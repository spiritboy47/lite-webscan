#!/bin/bash

# Lightweight Recon Script
# Usage: ./lite-webscan.sh <domain>

set -e

if [ -z "$1" ]; then
    echo "Usage: $0 <domain>"
    exit 1
fi

DOMAIN=$1
OUTPUT_DIR="scan-$DOMAIN"
mkdir -p "$OUTPUT_DIR"

# Subdomain Enumeration
echo "[*] Enumerating subdomains for $DOMAIN..."
subfinder -d "$DOMAIN" -silent > "$OUTPUT_DIR/subdomains.txt"

SUBDOMAIN_COUNT=$(wc -l < "$OUTPUT_DIR/subdomains.txt")
echo "[+] Found $SUBDOMAIN_COUNT subdomains:"
cat "$OUTPUT_DIR/subdomains.txt"
echo

# HTTP Probing
echo "[*] Probing live hosts with httpx..."
httpx -silent -l "$OUTPUT_DIR/subdomains.txt" > "$OUTPUT_DIR/live.txt"

LIVE_COUNT=$(wc -l < "$OUTPUT_DIR/live.txt")
echo "[+] Found $LIVE_COUNT live hosts:"
cat "$OUTPUT_DIR/live.txt"
echo

# Vulnerability Scanning
echo "[*] Scanning live hosts with nuclei (severity: low, medium, high, critical)..."
nuclei -l "$OUTPUT_DIR/live.txt" -severity low,medium,high,critical -silent -o "$OUTPUT_DIR/nuclei-results.txt"

echo "[+] Scan complete. Results saved in $OUTPUT_DIR/"
