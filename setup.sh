#!/bin/bash

# cat instalations.sh | sed -e "s/apt install/apt install -y/" | bash

NVIM_CONFIG_FOLDER="$HOME/.config/nvim/"

[ ! -f "./bin" ] && mkdir -p "./bin"
mkdir ./.local
[ ! -f "$NVIM_CONFIG_FOLDER" ] && mkdir -p "$NVIM_CONFIG_FOLDER"

setLink (){
    file=$1
    chmod +x $file

    filename="@${1##*/}"
    filename=$( basename $filename .sh )
    binPath=$( [[ ! -z "$2" ]] && echo "$2" || echo "./bin/$filename" )

    if [ -f "$binPath" ]; then
        echo "Existing link in $binPath, deleting..."
        sudo rm $binPath
    fi

    echo "Creating link of: $file -> $binPath"
    chmod +x $file
    sudo ln -f $file $binPath
}

for file in $( find ./scripts -type f ); do
    echo "Found: $file"
    setLink $file
done

alias n=nvim 
alias rm=trash
ln -f "./init.vim" "$NVIM_CONFIG_FOLDER/init.vim"

