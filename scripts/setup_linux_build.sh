#!/bin/bash

mkdir deps
zipname="cef_binary_3.1271.889_linux"

if [ ! -f deps/cef.zip ]; then
  wget -O deps/cef.zip https://github.com/downloads/pritambaral/brackets-shell/$zipname-32.zip
fi

unzip deps/cef.zip -d deps
mv deps/$zipname deps/cef

gyp --depth .
