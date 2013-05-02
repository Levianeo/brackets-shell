#~/bin/bash

# clean old files
rm -rf installer/linux/staging
mkdir -p installer/linux/staging

# copy binaries to staging
cp -r out/Release/* installer/linux/staging

# copy www and samples files to staging
cp -r ../brackets/src installer/linux/staging/www
cp -r ../brackets/samples installer/linux/staging/samples
