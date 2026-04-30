#!/bin/bash

# Arquivo temporário onde o número vai ficar salvo
CACHE_FILE="/tmp/tmux_updates_cache"

# Se o arquivo não existe, ou se foi modificado há mais de 3600 segundos (1 hora)
if [ ! -f "$CACHE_FILE" ] || [ $(expr $(date +%s) - $(stat -c %Y "$CACHE_FILE")) -gt 3600 ]; then
    # Roda o comando pesado e salva o número no arquivo
    checkupdates 2>/dev/null | wc -l > "$CACHE_FILE"
fi

# O tmux vai ler apenas o resultado que está no arquivo
cat "$CACHE_FILE"
