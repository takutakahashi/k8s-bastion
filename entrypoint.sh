#!/bin/bash

if [[ "$USER" = "" ]]; then
  echo "no user"
  exit 1
fi

if [[ "$LOGIN_SHELL" = "" ]]; then
  LOGIN_SHELL=/sbin/nologin
fi
useradd -s $LOGIN_SHELL $USER
mkdir /home/$USER
chown $USER:$USER /home/$USER
if [[ "$AUTHORIZED_KEYS_URL" != "" ]]; then
  mkdir -p /home/$USER/.ssh
  curl $AUTHORIZED_KEYS_URL > /home/$USER/.ssh/authorized_keys
  chown $USER:$USER -R /home/$USER/.ssh
fi
mkdir -p /run/sshd
exec /usr/sbin/sshd -D
