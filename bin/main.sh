#!/bin/bash
source "./bin/node.sh"
source "./bin/helpers.sh"
source "./bin/validators.sh"

NODE_VERSION="v${1}"
NODE_DIR="node"

OS=$(get_os)
ARCH=$(get_arch)

node_version_is_valid $NODE_VERSION
os_is_valid $OS

NODE_URL=$(build_node_url_for_download $NODE_VERSION $OS $ARCH) 

download_and_unpack $NODE_URL $NODE_DIR

clean_it_up