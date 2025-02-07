#!/bin/bash

echo "Downloading..."
sudo wget https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -O /usr/local/bin/yt-dlp

echo "Make executable..."
sudo chmod a+rx /usr/local/bin/yt-dlp  # Make executable

echo "Updating..."
sudo yt-dlp -U
