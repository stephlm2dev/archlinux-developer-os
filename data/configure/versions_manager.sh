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
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash ; \
  source "$HOME"/.zshrc ; \
  command -v nvm

echo "[$SCRIPT] install most common node versions" ; \
  nvm install stable ; \
  nvm install lts/carbon ; \
  nvm install lts/dubnium

echo "[$SCRIPT] install pyenv" ; \
  git clone https://github.com/pyenv/pyenv.git "$HOME"/.pyenv ; \
  echo 'export PYENV_ROOT="$HOME/.pyenv"' >> "$HOME"/.zshrc ; \
  echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> "$HOME"/.zshrc ; \
  echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> "$HOME"/.zshrc ; \
  source "$HOME"/.zshrc

echo "[$SCRIPT] install most common python versions" ; \
  PYTHON_27=$(pyenv install --list | sed 's/^  //' | grep '^2\.[0-9]*\.[0-9]*$' | tail -n1) ; \
  pyenv install "$PYTHON_27" ; \
  PYHTON_3=$(pyenv install --list | sed 's/^  //' | grep '^2\.[0-9]*\.[0-9]*$' | tail -n1) ; \
  pyenv install "$PYHTON_3" ; \
  pyenv global "$PYHTON_3"
