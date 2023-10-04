#!/bin/bash

function get_arch {
    local ARCH=$(uname -m)

    case $ARCH in 
        "x86_64" | "amd64")
        ARCH="x64";;
        "arm64")
        ARCH="arm64";;
    esac

    echo $ARCH

}

function get_os {
    local OS=$(uname | tr '[:upper:]' '[:lower:]')
    
    echo $OS
}

function download_and_unpack {
    local URL=$1
    local ARCHIVE="./env/${2}.tar.gz"
    local WHERE_TO_UNPACK="./env/${2}"

    mkdir -p $WHERE_TO_UNPACK

    curl -L $URL > $ARCHIVE
    tar -xf $ARCHIVE -C $WHERE_TO_UNPACK --strip-components=1
}

function clean_it_up {
    rm ./env/*.gz
}



