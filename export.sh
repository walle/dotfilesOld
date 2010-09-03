#!/bin/bash

USER_HOME=/home/$(whoami)/

cp -v ./.bash* ./.gitconfig ./.gitignore ./.gemrc $USER_HOME

source $USER_HOME/.bashrc
