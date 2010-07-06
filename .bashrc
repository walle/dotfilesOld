# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

#Use nano as editor with the no wrap flag
export EDITOR='nano -w'
  
# Bash autocomplete
if [ -f /etc/bash_completion ]; then
 . /etc/bash_completion
fi
 
# Aliases
if [ -s ~/.bash_aliases ] ; then source ~/.bash_aliases ; fi
