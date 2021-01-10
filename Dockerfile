FROM ubuntu

RUN apt update && apt install -y curl openssh-server

ENTRYPOINT ["/entrypoint.sh"]
