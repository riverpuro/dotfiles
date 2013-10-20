#!/bin/sh

DDSKK_VERSION="15.1"
SRC_DIR="${HOME}/local/src"
SRC_ARCHIVE="ddskk-${DDSKK_VERSION}.tar.gz"
SRC_URL="http://openlab.ring.gr.jp/skk/maintrunk/${SRC_ARCHIVE}"
DIC=(
http://openlab.jp/skk/dic/SKK-JISYO.L.gz
http://openlab.jp/skk/dic/SKK-JISYO.geo.gz
http://openlab.jp/skk/dic/SKK-JISYO.station.gz
)

if [ -d $SRC_DIR ] ; then
    mkdir -p "$SRC_DIR"
fi

cd $SRC_DIR
wget $SRC_URL
tar zxvf $SRC_ARCHIVE

cd `basename $SRC_ARCHIVE .tar.gz`
cd ./dic
for dic in "${DIC[@]}"
do
    wget $dic
done
gunzip *.gz

cd $SRC_DIR

# install information
make what-where
make install
