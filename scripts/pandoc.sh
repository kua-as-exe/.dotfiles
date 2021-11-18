in=$1
out=$2

npx nodemon -w $in --exec \
  pandoc --citeproc --csl=$HOME/.dotfiles/pandoc/apa.csl $in -o $out

