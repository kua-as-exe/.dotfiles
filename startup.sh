
# disable Touchscreen
# TouchscreenID=$( xinput | grep "ELAN Touchscreen" | sed 's/.*=//' | sed 's/\t.*//' )
# [ -z "$TouchscreenID" ] && xinput disable $TouchscreenID

export PATH="$HOME/.dotfiles/bin:$PATH"

# ALIASES

alias g='ddgr --colors bjdxxy -n 3'
alias gg='BROWSER=w3m ddgr --colors bjdxxy -n 6'
alias ggg='ddgr --colors bjdxxy --np -x'
alias la="ls -lAph --sort=size --color=tty"
alias lg='lazygit'

alias r='ranger'
alias lg='lazygit'
alias chat='npx chatgpt-tui --model gpt-3.5-turbo-16k'

alias t='tmux'


# SHORTCUTS

# ~ https://unix.stackexchange.com/questions/411549/zle-key-bindings-codes-list

#! os_icon                 # os identifier
function toggle-icon() { p10k display '*/os_icon'=hide,show }
zle -N toggle-icon
bindkey '^[1' toggle-icon

#! dir                     # current directory
function toggle-dir() { p10k display '*/dir'=hide,show }
zle -N toggle-dir
bindkey '^[2' toggle-dir

#! vcs                     # git status
function toggle-vcs() { p10k display '*/vcs'=hide,show }
zle -N toggle-vcs
bindkey '^[3' toggle-vcs

#! prompt_char           # prompt symbol
function toggle-prompt-char() { p10k display '*/prompt_char'=hide,show }
zle -N toggle-prompt-char
bindkey '^[4' toggle-prompt-char

#! Right prompt
function toggle-right-prompt() { p10k display '*/right'=hide,show }
zle -N toggle-right-prompt
bindkey '^[5' toggle-right-prompt
