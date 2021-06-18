#!/bin/bash

swapDir=~/.local/share/nvim/swap/

swaps=$(find $swapDir -type f | wc -l )

if [ "$swaps" -gt 0 ]; then
    echo "Founded $swaps swap files"
    echo "Removing nvim swap"
    for file in $( find $swapDir -type f ); do
        rm $file
    done
else
    echo "No swap files found"
fi
