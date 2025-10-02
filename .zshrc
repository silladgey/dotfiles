# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/ricky/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

alias de="cd ~/Desktop"
alias dl="cd ~/Downloads"
alias proj="cd ~/projects"

alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
