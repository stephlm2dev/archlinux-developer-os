#!/usr/bin/env bash

SCRIPT='versions_manager.sh'

echo "[$SCRIPT] executed as $USER"

echo "[$SCRIPT] install RVM" ; \
  rm -fr "$HOME"/.rvm ; \
  curl -sSL https://get.rvm.io | bash ;\
  type rvm | head -n1 ; \
  source "$HOME"/.rvm/scripts/rvm ; \
  rvm notes ; \
  rvm requirements

echo "[$SCRIPT] install ruby latest version" ; \
  rvm install ruby --latest

echo "[$SCRIPT] install nvm" ; \
  rm -fr "$HOME"/.nvm ; \
  wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | NVM_DIR=$HOME | bash ; \
  command -v nvm

echo "[$SCRIPT] install most common node versions" ; \
  nvm install stable ; \
  nvm install lts/carbon ; \
  nvm install lts/dubnium
