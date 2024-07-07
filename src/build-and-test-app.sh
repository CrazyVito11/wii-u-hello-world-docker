#!/usr/bin/env bash

set -e

# Build the application
./build-app.sh

# Send it to our console using wiiload
wiiload ./build/helloworld.rpx
