# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

plugins=(
  git
  history-search-multi-word
)

source $ZSH/oh-my-zsh.sh

# export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# vi mode with mode hint
set -o vi
export RPS1=$RPS1 # force the value of RPS1 for first line
setopt transientrprompt # removes right prompt after accepting commands
INSERT="%{$fg[yellow]%}%{$fg_bold[black]$bg[yellow]%} INSERT %{$reset_color%}"
COMMAND="%{$fg[blue]%}%{$fg_bold[black]$bg[blue]%} COMMAND %{$reset_color%}"
function zle-line-init zle-keymap-select {
  case $KEYMAP in
    vicmd) RPS1=$COMMAND;;
    viins|main) RPS1=$INSERT;;
    *) RPS1="";;
  esac
  RPS2=$RPS1
  zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select


# History
bindkey "^R" history-search-multi-word
zstyle ":plugin:history-search-multi-word" reset-prompt-protect 1
zstyle ":history-search-multi-word" highlight-color "fg=yellow,bold" # Color in which to highlight matched, searched text (default bg=17 on 256-color terminals)
zstyle ":plugin:history-search-multi-word" clear-on-cancel "yes" # Whether pressing Ctrl-C or ESC should clear entered query
HISTSIZE=100000
SAVEHIST=100000
setopt EXTENDED_HISTORY

# FZF is used by neovim through a search plugin.
export FZF_DEFAULT_COMMAND='find . -type f -not -path "*/node_modules/*" -not -path "*/.git/*" -not -path "*/build/*" -not -path "*/coverage/*" -not -path "*/dist/*" -not -name "yarn.lock" -not -name ".DS_Store"'

export LC_ALL=en_US.UTF-8

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm