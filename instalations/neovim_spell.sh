

SPELL_PATH="./.local/spell"
mkdir -p $SPELL_PATH

SPELL_LANGS=(
  es.latin1.spl
  es.latin1.sug
  es.utf-8.spl
  es.utf-8.sug
)


for lang in ${SPELL_LANGS[@]}; do
  LANG_PATH="$SPELL_PATH/$lang"
  if test -f "$LANG_PATH"; then
    echo "~ $lang Already installed" && continue
  fi
  echo "~ Downloading $lang";
  curl "http://ftp.vim.org/vim/runtime/spell/$lang" > "$LANG_PATH"
done
