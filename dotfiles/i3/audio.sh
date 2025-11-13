#!/bin/bash

exec pipewire &
sleep 0.8

exec wireplumber &
sleep 0.8

exec pipewire-pulse &
sleep 0.8

exec polybar &
