#!/bin/bash

if [[ "$USER" = "" ]]; then
  echo "no user"
  exit 1
fi

useradd -s /sbin/nologin $USER
mkdir /home/$USER
chown $USER:$USER /home/$USER
if [[ "$AUTHORIZED_KEYS_URL" != "" ]]; then
  curl $AUTHORIZED_KEYS > /home/$USER/.ssh/authorized_keys
fi
exec /usr/sbin/sshd -D
