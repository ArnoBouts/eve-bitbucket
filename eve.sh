#!/bin/sh

sha=$(curl -s https://api.bitbucket.org/2.0/repositories/$1/refs/branches/$2 | cut -d'"' -f6)
sed -i -e "s/$3 .*\$/$3 $sha/1" $4

