#!/usr/bin/env bash

SCRIPT='yay.sh'

echo "[$SCRIPT] executed as $USER"

echo "[$SCRIPT] install yay" ; \
  git clone https://aur.archlinux.org/yay.git .yay ; \
  cd .yay || exit ; \
  yes | makepkg --syncdeps --install --clean

echo "[$SCRIPT] install users packages" ; \
  yay -Sy --noconfirm --needed \
    google-cloud-sdk \
    gitflow-avh \
    git-hooks-git \
    heroku-cli \
    mysql \
    pgcli \
    rsyslog \
    source-highlight \
    tasksh \
    tmux-mem-cpu-load-git
# timew-git \

