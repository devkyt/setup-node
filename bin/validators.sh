#!/bin/bash
source "./bin/node.sh"
source "./bin/colors.sh"

function node_version_is_valid {

    if  [[ -z $1 ]]; 
    then
        echo -e "${BoldRed}Error: node version must be provided"
        exit 1
    fi

    if [[ ! $1 =~ ^v([0-9]{1,}).([0-9]{1,}).([0-9]{1,})$ ]];
    then
        echo -e "${BoldRed}Error: Node version should be in format xx.xx.xx. Got ${1} instead"
        exit 1
    fi

    node_version_exists $1 

}


function node_version_exists {
    local NODE_VERSION=$1
    local NODE_VERSIONS=$(get_available_node_versions)

    if [[ ! ${NODE_VERSIONS[@]} =~ $NODE_VERSION ]]; then
        echo -e "${BoldRed}Error: unavailable Node.js version - ${NODE_VERSION}. All available versions you can find here: https://nodejs.org/dist" >&2
        exit 1
    fi
}

function os_is_valid {
    local OS=$1
    local AVAILABLE_OS=("linux", "darwin")

    if [[ ! ${AVAILABLE_OS[@]} =~ $OS]]; then
        echo -e "${BoldRed}Error: OS ${OS} is not supported. This script works only for Linux and MacOS " >&2
        exit 1
    fi
}


