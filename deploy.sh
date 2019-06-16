#!/bin/bash

set -o errexit

main() {
  deploy_image
  build_infra

  echo "SUCCESS:
  Done! Built Completed using Terraform.
  "
}

deploy_image() {
  echo "INFO:
  Pushing docker image.
  "

  docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD && make push-image
}

build_infra() {
  echo "INFO:
  Building AWS Infrastructure.
  "
  
  make deploy
}