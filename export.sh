#!/bin/bash

USER_HOME=/home/$(whoami)/

cp -v ./.bash* ./.gitconfig ./.gitignore ./.gemrc ./.watchr $USER_HOME

source $USER_HOME/.bashrc
