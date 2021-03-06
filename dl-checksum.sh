#!/usr/bin/env sh
DIR=~/Downloads
MIRROR=https://waf.io

dl_ver() {
    local ver=$1
    local file=waf-${ver}
    local url=$MIRROR/$file
    local lfile=$DIR/$file
    if [ ! -e $lfile ];
    then
        wget -q -O $lfile $url
    fi

    printf "  # %s\n" $url
    printf "  '%s': sha256:%s\n" $ver $(sha256sum $lfile | awk '{print $1}')
}

dl_ver ${1:-2.0.20}
