#!/usr/bin/env bash

# --needed         do not reinstall up to date packages
# --noconfirm      do not ask for any confirmation
pacman -Sy --noconfirm --needed \
  ack \
  bat \
  colordiff \
  curl \
  diff-so-fancy \
  dos2unix \
  jq \
  fzf \
  git \
  gnupg \
  gzip \
  htop \
  ranger \
  ripgrep \
  rlwrap \
  tmux \
  vim \
  wget \
  yarn \
  zsh \
  zsh-completions \
  zsh-syntax-highlighting

# git-flow \
# git-hooks \
# heroku/brew/heroku \
# httpd \
# httpie \
# mplayer \
# mpv \
# pgcli \
# reattach-to-user-namespace \
# rsyslog \
# source-highlight \
# taskd \
# tasksh \
# timewarrior \
# tmux-mem-cpu-load \

echo 'Install Oh My ZSH' ; sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo 'Install Vundle' ; git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# echo 'Install Vim plugins' ; vim +PluginInstall +qall
