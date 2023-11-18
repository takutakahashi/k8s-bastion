FROM ubuntu

RUN apt update && apt install -y curl openssh-server zsh sudo
COPY ./entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
