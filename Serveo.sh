#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: ./Serveo.sh <local_port> [remote_port]"
    echo "If remote_port is not provided, a default port will be used by Serveo."
    exit 1
fi

local_port=$1
remote_port=$2

if [ -z "$2" ]; then
    echo "No remote port provided, using only local port: $local_port"
    remote_port=$local_port
fi

echo "Starting Serveo tunnel from public URL to localhost:$local_port with remote port $remote_port"
ssh -R $remote_port:localhost:$local_port serveo.net
