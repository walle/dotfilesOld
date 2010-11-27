# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="geoffgarside"

# Set to this to use case-sensitive completion
export CASE_SENSITIVE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git rails ruby gem github)

source $ZSH/oh-my-zsh.sh

# History
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000

#Aliases
# suffix
alias -s txt=vi
alias -s conf=vi
alias -s vhost=vi
alias -s cfg=vi
alias -s ini=vi
alias -s html=w3m
alias -s org=w3m
alias -s com=w3m
alias -s se=w3m
alias -s net=w3m
alias -s log=tail -500

# cd
alias ..='cd ..'

# dir
alias ...='../..'
alias ....='../../..'
alias .....='../../../..'
 
#nano
alias nano='nano -w'

# ls
alias ls="ls -A --color=auto"
alias l="ls -lAh --color=auto"
alias ll="ls -lah --color=auto"
alias la='ls -la --color=auto'
 
# git
alias gl='git pull'
alias gp='git push'
alias gd='git diff'
alias gc='git commit'
alias gca='git commit -a'
alias gco='git checkout'
alias gb='git branch'
alias gs='git status'
alias ga='git add'
alias gg='git log'
alias gps='git log --pretty=oneline origin/master..' # This requires a remote masterbranch


#TERM
function title {
      if [[ $TERM == "screen" ]]; then
        # Use these two for GNU Screen:
        print -nR $' 33k'$1$' 33'\
        print -nR $' 33]0;'$2$''
      elif [[ $TERM == "xterm" || $TERM == "rxvt" ]]; then
        # Use this one instead for XTerms:
        print -nR $' 33]0;'$*$''
      fi
}

# Customize to your needs...
export PATH=/home/walle/.rvm/gems/ruby-1.9.2-p0/bin:/bin:/home/walle/.rvm/rubies/ruby-1.9.2-p0/bin:/home/walle/.rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games
fpath=(~/.zsh/Completion $fpath)
