
[ -e ./.obsidian ] && cd ./.obsidian

echo $(ls)

for x in ~/.dotfiles/obsidian/*.*; do
  elem=$( basename $x )
  echo $elem $x

  # [[ -e $elem ]] && rm -r ./$elem

  ln -f $x ./$elem

done

