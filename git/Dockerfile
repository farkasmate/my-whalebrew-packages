FROM alpine:latest

ARG USER_MOUNT=/home/.user
ENV USER_MOUNT ${USER_MOUNT}

LABEL io.whalebrew.name git
LABEL io.whalebrew.config.volumes [ \
  "/etc/group:/etc/group:ro", \
  "/etc/passwd:/etc/passwd:ro", \
  "~/.gitconfig.d:${USER_MOUNT}/.gitconfig.d:ro", \
  "~/.gitconfig:${USER_MOUNT}/.gitconfig:ro", \
  "~/.ssh:${USER_MOUNT}/.ssh:ro", \
]
LABEL io.whalebrew.config.missing_volumes skip

RUN apk add --no-cache --update \
  git \
  less \
  openssh-client \
  && \
  chmod a+w /home

ADD entrypoint.sh /entrypoint.sh

WORKDIR /repo/
ENTRYPOINT ["/entrypoint.sh"]