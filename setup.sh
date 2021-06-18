#!/bin/bash

setLink (){
    file=$1
    chmod +x $file

    binPath=$( [[ ! -z "$2" ]] && echo "$2" || echo "/bin/${1##*/}" )

    if [ -f "$binPath" ]; then
        echo "Existing link in $binPath, deleting..."
        sudo rm $binPath
    fi

    echo "Creating link of: $file -> $binPath"
    sudo ln -f $file $binPath
}

for file in $( find ./scripts -type f ); do
    echo "Found: $file"
    setLink $file
done

alias n=nvim 
