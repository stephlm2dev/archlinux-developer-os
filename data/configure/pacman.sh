#!/usr/bin/env bash

SCRIPT='pacman.sh'

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
  sed -s 's/^#Server/Server/' /etc/pacman.d/mirrorlist.backup > /dev/null ; \
  reflector \
    --country 'France' \
    --latest 10 \
    --fastest 10 \
    --protocol http \
    --protocol https  \
    --sort rate \
    --save /etc/pacman.d/mirrorlist ; \
  pacman -Syu --noconfirm

# --needed         do not reinstall up to date packages
# --noconfirm      do not ask for any confirmation
echo "[$SCRIPT] install minimal bash packages" ; \
  pacman -Sy --noconfirm --needed \
    ack \
    aws-cli \
    bat \
    base-devel \
    colordiff \
    curl \
    cronie \
    diff-so-fancy \
    dos2unix \
    jq \
    fzf \
    git \
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

echo "[$SCRIPT] install specific dev packages" ; \
  pacman -Sy --noconfirm --needed \
    apache \
    postgresql

echo "[$SCRIPT] clean packages" ; pacman -Sc --noconfirm
