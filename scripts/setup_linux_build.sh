#!/bin/bash

zipname="cef_binary_3.1271.889_linux"

mkdir deps
pushd deps

# download CEF
if [ ! -f cef.zip ]; then
  wget -O cef.zip https://github.com/downloads/pritambaral/brackets-shell/$zipname-32.zip
fi

# extract CEF 
rm -rf cef
unzip cef.zip
mv $zipname cef

# get libudev0 for Ubuntu 13.04
if egrep -q "13\.04" /etc/issue; then
  wget -O libudev0_175-0ubuntu19_i386.deb http://launchpadlibrarian.net/132294322/libudev0_175-0ubuntu19_i386.deb
  dpkg -i *.deb 
  apt-get install -f
fi

# download chromium dependency script
if [ ! -f install-build-deps.sh ]; then
  wget -O install-build-deps.sh http://src.chromium.org/svn/trunk/src/build/install-build-deps.sh
  chmod 755 install-build-deps.sh
fi

# install dependecies
install-build-deps.sh --no-chromeos-fonts

popd

# install and run gyp to create makefile
apt-get install gyp
gyp --depth .
