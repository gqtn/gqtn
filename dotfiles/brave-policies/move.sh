#!/bin/bash

correct_dir=$(pwd)

cd $correct_dir || exit 1


sudo mkdir -p /etc/brave/policies/managed/
sudo cp policies.json /etc/brave/policies/managed/
sudo chown root:root /etc/brave/policies/managed/policies.json 
