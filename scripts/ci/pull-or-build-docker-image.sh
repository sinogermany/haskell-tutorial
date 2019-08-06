#!/usr/bin/env bash

set -e

DOCKER_REPO_NAME="haskell-dev"
STACK_MD5=$(md5sum stack.yaml | cut -d ' ' -f 1)
PACKAGE_MD5=$(md5sum package.yaml | cut -d ' ' -f 1)
DOCKER_TAG="${STACK_MD5}-${PACKAGE_MD5}"
DOCKER_IMAGE="$DOCKER_USERNAME/$DOCKER_REPO_NAME:$DOCKER_TAG"
LOCAL_IMAGE="haskell-tutorial:local"

function docker_login() {
  echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
}

function docker_pull_and_tag() {
  docker pull $DOCKER_IMAGE && docker tag $DOCKER_IMAGE $LOCAL_IMAGE
}

function docker_build_and_push() {
  docker-compose build haskell && docker tag $LOCAL_IMAGE $DOCKER_IMAGE && docker push $DOCKER_IMAGE
}

docker_login
docker_pull_and_tag || docker_build_and_push
