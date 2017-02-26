#!/bin/sh

SHA=$(curl -s https://api.bitbucket.org/2.0/repositories/${PLUGIN_REPOSITORY}/refs/branches/${PLUGIN_BRANCH} | cut -d'"' -f6)

cd eve

grep -H -o -r "${PLUGIN_VARIABLE} [1-9a-fA-F]*$" * | while read LINE
do
        FILE=`echo $LINE | cut -d":" -f1`
        OLD=`echo $LINE | cut -d" " -f2`

        echo "${FILE} : ${PLUGIN_VARIABLE} : ${OLD} -> ${SHA}"
        sed -i -e "s/${PLUGIN_VARIABLE} [0-9a-fA-F]*\$/${PLUGIN_VARIABLE} ${SHA}/1" ${FILE}

done
