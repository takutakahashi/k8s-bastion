FROM ubuntu

RUN apt update && apt install -y curl openssh-server
COPY ./entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
