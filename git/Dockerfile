FROM alpine:latest

ARG USER_MOUNT=/home/.user
ENV USER_MOUNT ${USER_MOUNT}

LABEL io.whalebrew.name git
LABEL io.whalebrew.config.environment ["SSH_AUTH_SOCK"]
LABEL io.whalebrew.config.volumes [ \
  "/etc/group:/etc/group:ro", \
  "/etc/passwd:/etc/passwd:ro", \
  "~/.gitconfig.d:${USER_MOUNT}/.gitconfig.d:ro", \
  "~/.gitconfig:${USER_MOUNT}/.gitconfig:ro", \
  "~/.ssh:${USER_MOUNT}/.ssh:ro", \
  '$SSH_AUTH_SOCK:$SSH_AUTH_SOCK:ro', \
]
LABEL io.whalebrew.config.missing_volumes skip
LABEL io.whalebrew.required_version >=0.3.0

RUN apk add --no-cache --update \
  git \
  less \
  openssh-client \
  && \
  chmod a+w /home

ADD entrypoint.sh /entrypoint.sh
ADD ssh_known_hosts /etc/ssh/ssh_known_hosts

WORKDIR /repo/
ENTRYPOINT ["/entrypoint.sh"]
