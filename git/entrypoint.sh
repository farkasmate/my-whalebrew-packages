#!/bin/sh

mkdir -p ${HOME}

ln -s ${USER_MOUNT}/.gitconfig   ${HOME}/.gitconfig
ln -s ${USER_MOUNT}/.gitconfig.d ${HOME}/.gitconfig.d
ln -s ${USER_MOUNT}/.ssh         ${HOME}/.ssh

exec git ${@}
