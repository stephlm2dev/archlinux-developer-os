#!/usr/bin/env bash

SCRIPT='terminal.sh'

echo "[$SCRIPT] executed as $USER"

# Tmux
TMUX_DIR="$HOME/.tmux"
echo "[$SCRIPT] Install Tmux plugins manager" ; \
  git clone https://github.com/tmux-plugins/tpm "$TMUX_DIR"/plugins/tpm

echo "[$SCRIPT] tmux plugin: tmux-resurrect" ; \
  mkdir "$TMUX_DIR/resurrect/"

# Oh My ZSH
ZSH_DIR="$HOME/.oh-my-zsh"
ZSH_PLUGINS_DIR="${ZSH_CUSTOM:-$ZSH_DIR/custom/plugins}"
echo "[$SCRIPT] Install Oh My ZSH" ; \
  rm -fr "$ZSH_DIR" ; \
  curl -Lo install.sh https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh ; \
  sh install.sh --keep-zshrc ; \
  rm -fr install.sh

echo "[$SCRIPT] Zsh plugin: zsh-nvm" ; \
  git clone https://github.com/lukechilds/zsh-nvm "$ZSH_PLUGINS_DIR"/zsh-nvm
echo "[$SCRIPT] Zsh plugin: zsh-autosuggestions" ; \
  git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_PLUGINS_DIR"/zsh-autosuggestions
echo "[$SCRIPT] Zsh plugin: zsh-syntax-highlighting" ; \
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_PLUGINS_DIR"/zsh-syntax-highlighting; \
  echo "source $ZSH_PLUGINS_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> "${ZDOTDIR:-$HOME}"/.zshrc
echo "[$SCRIPT] Zsh plugin: k" ; \
  git clone https://github.com/supercrabtree/k "$ZSH_PLUGINS_DIR"/k

# Vim
VIM_DIR="$HOME/.vim"
echo "[$SCRIPT] Create backup, swape and undo directories" ; \
  mkdir -p "$VIM_DIR"/{backup_files,swap_files,undo_files}
echo "[$SCRIPT] Install Vundle" ; \
  rm -fr "$VIM_DIR"/bundle/ ;
  git clone https://github.com/VundleVim/Vundle.vim.git "$VIM_DIR"/bundle/Vundle.vim
echo "[$SCRIPT] Install Vim plugins" ; \
  vim +PluginInstall +qall ; \
  exit 0
