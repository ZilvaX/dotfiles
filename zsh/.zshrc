# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/kevin/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Prompt
autoload -Uz promptinit
promptinit

# Support for Bash autocomplete
autoload -Uz bashcompinit
bashcompinit -i

# Aliases
source ~/.aliases

# Environment Variables
source ~/.variables

# Binding ctrl + directions
bindkey  "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word

# tmux startup
# https://unix.stackexchange.com/questions/43601/how-can-i-set-my-default-shell-to-start-up-tmux
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

### zplug ###
# Check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
  git clone https://github.com/zplug/zplug ~/.zplug
  source ~/.zplug/init.zsh && zplug update --self
fi

source ~/.zplug/init.zsh

zplug "modules/completion", from:prezto
zplug "modules/directory", from:prezto
zplug "modules/git", from:prezto

# Syntax Highlighting
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# Load theme file
zplug 'dannynimmo/punctual-zsh-theme', as:theme

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load
