#!/bin/sh

sha=$(curl -s https://api.bitbucket.org/2.0/repositories/${PLUGIN_REPOSITORY}/refs/branches/${PLUGIN_BRANCH} | cut -d'"' -f6)
echo "${PLUGIN_VARIABLE} $sha"
sed -i -e "s/${PLUGIN_VARIABLE} .*\$/${PLUGIN_VARIABLE} $sha/1" ${PLUGIN_FILE}

