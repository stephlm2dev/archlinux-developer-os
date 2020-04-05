#!/usr/bin/env bash

SCRIPT='root.sh'

echo "[$SCRIPT] executed as $USER"

echo "[$SCRIPT] set zsh as default shell for $USER" ; \
  chsh -s /bin/zsh

echo "[$SCRIPT] set zsh as default shell for vagrant" ; \
  chsh -s /bin/zsh vagrant

echo "[$SCRIPT] set screenfetch at shell login" ; \
  echo 'screenfetch' | sudo tee -a /etc/profile | sudo tee -a /etc/bash.bashrc

# TODO https://wiki.archlinux.org/index.php/PostgreSQL
# TODO https://wiki.archlinux.fr/MySQL

