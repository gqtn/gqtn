#!/usr/bin/env bash

IFACE="eth0"
IP_CIDR=$(ip -o -4 addr show "$IFACE" | awk '{print $4}')

if [ -n "$IP_CIDR" ]; then
    echo "$IP_CIDR"
else
    echo "Disconnected"
fi

