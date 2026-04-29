#!/bin/bash

correct_dir=$(pwd)

cd $correct_dir || exit

sudo cp config.json /etc/xdg/swaync/

sudo chown root:root /etc/xdg/swaync/config.json
