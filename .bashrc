# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

#Use nano as editor with the no wrap flag
export EDITOR='nano -w'
  
# Bash autocomplete
if [ -f /opt/local/etc/bash_completion ]; then
  . /opt/local/etc/bash_completion
fi
 
# Aliases
if [ -s ~/.bash_aliases ] ; then source ~/.bash_aliases ; fi
