#!/bin/bash

function get_available_node_versions {
    local VERSIONS_FILENAME="versions"

    load_node_versions_and_parse_them $VERSIONS_FILENAME

    local NODE_VERSIONS=$(grep -E "^v([0-9]{1,}).([0-9]{1,}).([0-9]{1,})" ${VERSIONS_FILENAME}.txt)

    delete_node_versions_files $VERSIONS_FILENAME

    echo $NODE_VERSIONS
}

function load_node_versions_and_parse_them {
    local VERSIONS_FILENAME=$1

    curl https://nodejs.org/dist/ > ${VERSIONS_FILENAME}.html
    xmllint --html --xpath ".//a/text()" versions.html | sed 's/\/$//' > ${VERSIONS_FILENAME}.txt
}


function delete_node_versions_files {
    local VERSIONS_FILENAME=$1

    rm ${VERSIONS_FILENAME}.html
    rm ${VERSIONS_FILENAME}.txt
}

function build_node_url_for_download {
    local NODE_VERSION=$1
    local OS=$2
    local ARCH=$3

    local NODE_URL="https://nodejs.org/dist/${NODE_VERSION}/node-${NODE_VERSION}-${OS}-${ARCH}.tar.gz"

    echo $NODE_URL
}