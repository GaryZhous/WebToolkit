#!/bin/bash

# Simple Web Application Security Testing Script
# Ensure the following tools are installed: nmap, nikto, curl

# Target web application URL and IP
TARGET_URL=$1
TARGET_IP=$2

if [ -z "$TARGET_URL" ] || [ -z "$TARGET_IP" ]; then
  echo "Usage: $0 <target_url> <target_ip>"
  exit 1
fi

echo "Starting security checks for $TARGET_URL ($TARGET_IP)..."

# Step 1: Check for open ports using nmap
echo "Running port scan with nmap..."
nmap -p 1-65535 -T4 -A -v $TARGET_IP > nmap_results.txt
echo "Port scan complete. Results saved to nmap_results.txt."

# Step 2: Check for known vulnerabilities using Nikto
echo "Running vulnerability scan with Nikto..."
nikto -h $TARGET_URL > nikto_results.txt
echo "Nikto scan complete. Results saved to nikto_results.txt."

# Step 3: Check security headers using curl
echo "Checking security headers..."
curl -s -I $TARGET_URL | grep -E "Strict-Transport-Security|Content-Security-Policy|X-Frame-Options|X-XSS-Protection|X-Content-Type-Options" > security_headers.txt
echo "Security headers check complete. Results saved to security_headers.txt."

# Step 4: Check SSL configuration with openssl
echo "Checking SSL configuration..."
echo | openssl s_client -connect $TARGET_IP:443 2>/dev/null | openssl x509 -noout -dates > ssl_check.txt
echo "SSL check complete. Results saved to ssl_check.txt."

# Step 5: Output a summary of findings
echo "Summary of security checks:"
echo "1. Port scan results: nmap_results.txt"
echo "2. Vulnerability scan results: nikto_results.txt"
echo "3. Security headers results: security_headers.txt"
echo "4. SSL check results: ssl_check.txt"

echo "Web application security checks completed."
