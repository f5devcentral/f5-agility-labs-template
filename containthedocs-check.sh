#!/usr/bin/env bash

set -x

echo "Checking grammar and style"
# Runs the grammar check on everything except the /docs/drafts directory
#write-good `find ./docs -not \( -path ./docs/drafts -prune \) -name '*.rst'` --so --no-illusion --thereIs --cliches || true
# echo "Checking links"
# make linkcheck

COMMAND="write-good `find ./docs -name '*.rst'`"

. ./containthedocs-image-$ARCH

exec docker run --rm -it \
  -v "$PWD":"$PWD" --workdir "$PWD" \
  ${DOCKER_RUN_ARGS} \
  -e "LOCAL_USER_ID=$(id -u)" \
  ${DOC_IMG} ${COMMAND}
