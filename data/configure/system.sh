#!/usr/bin/env bash

SCRIPT='system.sh'

echo "[$SCRIPT] executed as $USER"

echo "[$SCRIPT] import archlinux keys" ; \
  pacman-key --init ; \
  pacman-key --populate archlinux

echo "[$SCRIPT] update Archlinux" ; \
  pacman -Syu --noconfirm

echo "[$SCRIPT] add pacman-contrib" ; \
  pacman -Sy --noconfirm pacman-contrib

echo "[$SCRIPT] find best mirrors for pacman" ; \
  cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup ; \
  sed -s 's/^#Server/Server/' /etc/pacman.d/mirrorlist.backup > dev/null ; \
  rankmirrors -n 10 /etc/pacman.d/mirrorlist.backup > /etc/pacman.d/mirrorlist

# --needed         do not reinstall up to date packages
# --noconfirm      do not ask for any confirmation
echo "[$SCRIPT] install minimal dev/bash packages" ; pacman -Sy --noconfirm --needed \
  ack \
  bat \
  base-devel \
  colordiff \
  curl \
  diff-so-fancy \
  dos2unix \
  jq \
  fzf \
  gcc \
  gnupg \
  gzip \
  httpie \
  htop \
  ranger \
  ripgrep \
  rlwrap \
  screenfetch \
  taskd \
  tmux \
  vim \
  wget \
  yarn \
  zsh \
  zsh-completions \
  zsh-syntax-highlighting

echo "[$SCRIPT] install specific dev packages" ; pacman -Sy --noconfirm --needed \
  apache

# git-flow \
# git-hooks \
# heroku/brew/heroku \
# mpv \
# pgcli \
# reattach-to-user-namespace \
# rsyslog \
# source-highlight \
# tasksh \
# timewarrior \
# tmux-mem-cpu-load \

echo "[$SCRIPT] set zsh as default shell for $USER" ; chsh -s /bin/zsh
echo "[$SCRIPT] set zsh as default shell for vagrant" ; chsh -s /bin/zsh vagrant
echo "[$SCRIPT] set screenfetch at shell login" ; echo 'screenfetch' | sudo tee -a /etc/profile | sudo tee -a /etc/bash.bashrc
echo "[$SCRIPT] clean packages" ; pacman -Sc --noconfirm
