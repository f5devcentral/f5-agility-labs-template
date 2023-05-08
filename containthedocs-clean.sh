#!/usr/bin/env bash

set -x

COMMAND="make -C docs clean"
ARCH=`uname -m`

. ./containthedocs-image-$ARCH

exec docker run --rm -it \
  -v "$PWD":"$PWD" --workdir "$PWD" \
  ${DOCKER_RUN_ARGS} \
  -e "LOCAL_USER_ID=$(id -u)" \
  ${DOC_IMG} ${COMMAND}
