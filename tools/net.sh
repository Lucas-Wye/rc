#!/bin/bash

PORT=7701
TUNNEL_GATEWAY=user@ip

/bin/bash -c \
"ssh -qTfnN -D $PORT $TUNNEL_GATEWAY -o \"ServerAliveInterval 30\" -o \"TCPKeepAlive yes\""

# export http_proxy=socks5://127.0.0.1:7701 https_proxy=socks5://127.0.0.1:7701 all_proxy=socks5://127.0.0.1:7701
