#!/bin/bash
set -ex

# Set architecture based on the target platform
if [[ "$target_platform" == *"aarch64"* || "$target_platform" == *"arm64"* ]]; then
    # ARM64 architecture (linux-aarch64, osx-arm64)
    export GOARCH=arm64
else
    # AMD64 architecture (linux-64, osx-64, win-64)
    export GOARCH=amd64
fi

echo "Building for target_platform: $target_platform with GOARCH: $GOARCH"

# Set up Go path
export GOPATH=${SRC_DIR}/gopath
mkdir -p ${GOPATH}

# Build esbuild
make esbuild

# Install the binary
mkdir -p $PREFIX/bin
cp esbuild $PREFIX/bin/esbuild

# Enable removal of build tree on osx
find ${GOPATH} -type d -exec chmod u+w {} \;
find ${GOPATH} -type f -exec chmod u+w {} \;

