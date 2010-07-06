#!/bin/bash

USER_HOME=/home/$(whoami)/

cp -v ./.bash* ./.gitconfig ./.gitignore $USER_HOME

source $USER_HOME/.bashrc
