# Aliases
alias ls='ls --color=auto'
alias vi='vim'

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

alias cpuinfo='watch -n 1 "cat /proc/cpuinfo | grep \"^cpu MHz\""'
alias sensors='watch -n 1 "sensors"'

# Retain previous tab's working directory on opening new tab
# (gnome-terminal bug workaround)
[[ -f /etc/profile.d/vte.sh ]] && . /etc/profile.d/vte.sh

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename '/home/adrian/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Completion rules
zstyle ':completion:*' menu select
bindkey '^[[Z' reverse-menu-complete

zstyle ':completion:*' special-dirs true
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Prompt
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr '%F{green}●%f'
zstyle ':vcs_info:*' unstagedstr '%F{red}●%f'
zstyle ':vcs_info:git:*' formats '[%F{cyan}%b%f%c%u]'
zstyle ':vcs_info:git:*' actionformats '[%F{cyan}%b (%a)%f%c%u]'

setopt PROMPT_PERCENT
setopt PROMPT_SUBST

PROMPT='%B[%n:%F{yellow}%25<..<%~%f%<<]%b$ '
RPROMPT='%B$vcs_info_msg_0_%b'

# Enable plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
