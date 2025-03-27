#!/bin/bash

updates=$(xbps-install -Suvn | grep -c 'update')

if [ "$updates" -gt 0 ]; then
    echo "Available: $updates"
else
    echo "No updates"
fi
