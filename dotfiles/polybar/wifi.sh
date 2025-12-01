#!/bin/bash

# Interface Wi-Fi UP com IPv4
IFACE=$(ip -br -4 addr | awk '/^(w|wl)/ && $2=="UP" {print $1; exit}')

[ -z "$IFACE" ] && echo "---" && exit 0

IP_CIDR=$(ip -o -4 addr show "$IFACE" | awk '{print $4}')
echo "${IP_CIDR:----}"
