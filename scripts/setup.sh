#!/bin/bash

setLink (){
    file=$1
    binPath=$( [[ ! -z "$2" ]] && echo "$2" || echo "/bin/${1/#.\/}" )

    if [ -f "$binPath" ]; then
        echo "Existing link in $binPath, deleting..."
        sudo rm $binPath
    fi

    echo "Creating link of: $file -> $binPath"
    sudo ln -sbf $file $binPath
}

setLink ./mkdcd
setLink ./removeNvimSwap

alias n=nvim 
