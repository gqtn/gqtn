#!/bin/bash

# Busca por conexões ativas no NetworkManager (filtrando por vpn ou wireguard)
VPN_NAME=$(nmcli -t -f NAME,TYPE connection show --active | awk -F: '/vpn|wireguard/ {print $1; exit}')

# Se encontrou alguma VPN conectada
if [ -n "$VPN_NAME" ]; then
    # Exibe um ícone de cadeado (opcional, requer fonte nerd) e o nome
    echo "$VPN_NAME"
else
    # Segue o mesmo padrão do seu eth.sh para quando não há conexão
    echo "---"
fi
