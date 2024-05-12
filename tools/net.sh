#!/bin/bash

PORT=7701
TUNNEL_GATEWAY=user@ip

echo "Current $PORT process: $(ps -ef | grep $PORT)"

read -p "Continue？(Y/N): " userInput
if [[ "$userInput" == "Y" ]]; then
    echo "running ssh..."
    /bin/bash -c \
        "ssh -qTfnN -D $PORT $TUNNEL_GATEWAY -o \"ServerAliveInterval 30\" -o \"TCPKeepAlive yes\""
else
    exit 0
fi

# export http_proxy=socks5://127.0.0.1:7701 https_proxy=socks5://127.0.0.1:7701 all_proxy=socks5://127.0.0.1:7701
# export http_proxy=socks5://127.0.0.1:7702 https_proxy=socks5://127.0.0.1:7702 all_proxy=socks5://127.0.0.1:7702
