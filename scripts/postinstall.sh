#!/bin/bash

if [ `uname` == "Linux" ]; then
    # Linux only: install development dependencies
    sudo apt-get install --assume-yes wget p7zip-full libnss3-1d libnspr4-0d gyp gtk+-2.0
fi