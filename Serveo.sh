#!/bin/bash
# Powered by serveo.net

# Check if the local port number is provided as an argument
if [ $# -eq 0 ]; then
    echo "Usage: ./Serveo.sh <local_port> [remote_port]"
    echo "If remote_port is not provided, port 80 will be used by default."
    exit 1
fi

local_port=$1
remote_port=${2:-80}

echo "Starting Serveo tunnel from public URL to localhost:$local_port with remote port $remote_port"
ssh -R $remote_port:localhost:$local_port serveo.net
