set -ex

export GOARCH=amd64

export GOPATH=${SRC_DIR}/gopath
mkdir -p ${GOPATH}
export GO111MODULE=auto
export CGO_ENABLED=0

make esbuild

find ${GOPATH} -type d -exec chmod u+w {} \;
find ${GOPATH} -type f -exec chmod u+w {} \;

mkdir -p $PREFIX/bin
cp esbuild $PREFIX/bin/esbuild

