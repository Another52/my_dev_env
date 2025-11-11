#set zinit directory
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

#download if not exist
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

#source zinit
source "${ZINIT_HOME}/zinit.zsh"

#add Powerlevel10k
#zinit ice depth=1; zinit light romkatv/powerlevel10k

#add plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions

# colors
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#525252'

#aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias lsa='ls -a'

#keybinds
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

#completions
autoload -Uz compinit && compinit
zinit cdreplay -q

#History
HISTSIZE=100000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_expire_dups_first
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

#completion styling
zstyle ':completion:*' menu select=1
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

#Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
