Color_Off="\[\033[0m\]"       # Text Reset
Green="\[\033[0;32m\]"        # Green
Yellow="\[\033[0;33m\]"       # Yellow
IRed="\[\033[0;91m\]"         # Red

TIME="\t"
PathShort="\w"

export PS1=$IBlack[$TIME]$Color_Off'$(git branch &>/dev/null;\
if [ $? -eq 0 ]; then \
  echo "$(echo `git status` | grep "nothing to commit" > /dev/null 2>&1; \
  if [ "$?" -eq "0" ]; then \
    # @4 - Clean repository - nothing to commit
    echo "'$Green'"$(__git_ps1 " (%s)"); \
  else \
    # @5 - Changes to working tree
    echo "'$IRed'"$(__git_ps1 " {%s}"); \
  fi) '$BYellow$PathShort$Color_Off' \$ "; \
else \
  # @2 - Prompt when not in GIT repo
  echo " '$Yellow$PathShort$Color_Off' \$ "; \
fi)'

export CLICOLOR=1

# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

if [ -s /usr/local/etc/bash_completion.d/ ] ; then source /usr/local/etc/bash_completion.d/git-completion.bash ; fi

# Add bin folder
export PATH=~/.bin:/usr/local/bin:$PATH

# Set editor
export EDITOR='subl -w'

c() { cd ~/gitrepositories/$1; }
_c() {
  local cur
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"

  local tags=$(for t in `ls ~/gitrepositories | \
                      awk '{print $1}'`; do echo ${t}; done)
  COMPREPLY=($(compgen -W "${tags}" $cur))
}

complete -F _c c

# Aliases
if [ -s ~/.bash_aliases ] ; then source ~/.bash_aliases ; fi

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads R


# Set LC_CTYPE to work around this problem: http://mod16.org/hurfdurf/?p=189
export LC_CTYPE="en_US.UTF-8"