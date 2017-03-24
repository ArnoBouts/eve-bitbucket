#!/bin/sh

echo "Get Bitbucket commit id for branch ${PLUGIN_BRANCH} of ${PLUGIN_REPOSITORY}"

SHA=$(curl -s https://api.bitbucket.org/2.0/repositories/${PLUGIN_REPOSITORY}/commits/${PLUGIN_BRANCH} | cut -d'"' -f8)

cd eve

grep -H -o -r "${PLUGIN_VARIABLE} [0-9a-fA-F]*$" * | while read LINE
do
        FILE=`echo $LINE | cut -d":" -f1`
        OLD=`echo $LINE | cut -d" " -f2`

        echo "${FILE} : ${PLUGIN_VARIABLE} : ${OLD} -> ${SHA}"
        sed -i -e "s/${PLUGIN_VARIABLE} [0-9a-fA-F]*\$/${PLUGIN_VARIABLE} ${SHA}/1" ${FILE}

done
