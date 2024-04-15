#!/bin/bash

x="$1"

target=$(find "$x" -maxdepth 1 -type f -not -name "*.gz")


if [[ -n $target ]];
then
    for files in "$x"/*
    do
        if [[ ! -d "${files##*/}" ]] ; then
            gzip "${files}"
            printf "Compressed ${files} to gz format :)\n"
        else
            printf "Skipping ${files} as it's a directory\n"
        fi
    done
else
    echo "No uncompressed files found in the specified directory.\n"
fi


