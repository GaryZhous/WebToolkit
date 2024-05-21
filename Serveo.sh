#!/bin/bash
#!/bin/bash

# Powered by serveo.net

# Check if the local port number is provided as an argument
if [ $# -eq 0 ]; then
    echo "Usage: ./Serveo.sh <local_port> [remote_port]"
    echo "If remote_port is not provided, port 80 will be used by default."
    echo "If you wish to change the remote subdomain, provide 'change' as the third argument."
    exit 1
fi

local_port=$1
remote_port=${2:-80}

echo "Starting Serveo tunnel from public URL to localhost:$local_port with remote port $remote_port"
if [ "$3" = "change" ]; then
    # Seed with the time using UNIX timestamp, so it generates a unique subdomain each time
    ssh -R $remote_port:localhost:$local_port $(date +%Y%m%d%H%M%S)-$RANDOM@serveo.net 
else
    # Use default serveo.net subdomain
    ssh -R $remote_port:localhost:$local_port serveo.net
fi
