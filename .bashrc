# .bashrc
# Sources:
# * https://github.com/briancain/starter-dotfiles/blob/master/bashrc
# 

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Aliases
# 
# Commands
alias l='ls'
alias ..='cd ../'
alias ...='cd ../../'
alias la='l -al'
alias ag='ag --path-to-ignore ~/.ag_ignore'
alias lach='la -ch'
alias reload='source ~/.bashrc'
alias editprofile='subl ~/.bashrc'
## Git
alias g='git'
alias ga='g add .'
alias gb='g branch'
alias gc='g commit -ae'
alias gd='g diff'
alias gs='g status'
alias gl='g log'
alias gm='g merge'
alias gms='gm --squash'
alias gpu='g push'
alias gpl='g pull'
alias gpf='gp --force'
alias gac='git add . && gc'
alias gba='g branch --all'
alias glo='gl --one-line'
alias gco='g checkout'
alias gcob='gco -b'
alias gcom='gco master'
alias gcos='gco staging'
alias gcod='gco development'
alias gcqa='gco qa'
alias greb='g rebase'
alias grib='greb -i'
alias gpla='gpl --all'
## NPM
alias ni="npm install"
alias nu="npm uninstall"
alias nup="npm update"
alias nri="rm -r node_modules && npm install"
## Applications
alias chrome="open -a ~/Applications/Google\ Chrome.app"

export TZ=UTC

if [ -f `brew --prefix`/etc/bash_completion.d/git-completion.bash ]; then
  . `brew --prefix`/etc/bash_completion.d/git-completion.bash
fi

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\[\033[32m\]\w\[\033[33m\]\\n\$(parse_git_branch)\[\033[00m\] $ "
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
