#!/bin/sh
#

cd /root

if [ ! "$(ls -A /dotfiles)" ];
then
  git clone $DOTFILES /dotfiles
fi
rcup -d /dotfiles

imapfilter -v
