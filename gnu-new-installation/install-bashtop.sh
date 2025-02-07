#!/bin/bash
    
echo "Dowloading"
wget -qO btop.tbz https://github.com/aristocratos/btop/releases/latest/download/btop-x86_64-linux-musl.tbz

echo "Installing"
sudo tar xf btop.tbz --strip-components=2 -C /usr/local ./btop/bin/btop

echo "Cleaning"
rm -rf btop.tbz

echo "Enjoy it! :) "
