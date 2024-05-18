#!/bin/bash

script_dir=$(dirname "$0")

for fileName in $script_dir/*.sh; do
	if [[ $fileName =~ .*main.sh* ]]; then
		continue
	fi
	source $fileName
done
