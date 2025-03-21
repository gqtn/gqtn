#!/bin/bash

curl -s -X POST "https://api.openai.com/v1/chat/completions" \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $key" \
    -d '{
        "model": "gpt-3.5-turbo",
        "messages": [
            {
                "role": "system",
                "content": "$."
            },
            {
                "role": "user",
                "content": "$"
            }
        ]
    }' | json_pp
