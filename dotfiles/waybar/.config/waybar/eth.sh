#!/bin/bash

# Interface ethernet UP com IPv4
IFACE=$(ip -br -4 addr | awk '/^(e|enp|eno|eth|br)/ && $2=="UP" {print $1; exit}')

# Se não tiver
[ -z "$IFACE" ] && echo "---" && exit 0

IP_CIDR=$(ip -o -4 addr show "$IFACE" | awk '{print $4}')
echo "$IFACE ${IP_CIDR:----}"
