#!/bin/bash

set -o errexit

main() {
  setup_docker_dependencies
  setup_terraform_dependencies
  update_docker_configuration

  echo "SUCCESS:
  Done! Finished setting up Travis machine.
  "
}

setup_docker_dependencies() {
  echo "INFO:
  Setting up Docker dependencies.
  "

  sudo apt update -y
  sudo apt install --only-upgrade docker-ce -y
  docker info
}

setup_terraform_dependencies() {
  echo "INFO:
  Setting up Terraform dependencies.
  "
  
  sudo apt install unzip -y
  wget https://releases.hashicorp.com/terraform/0.12.2/terraform_0.12.2_linux_amd64.zip
  unzip terraform_0.12.2_linux_amd64.zip
  ./terraform version
}

update_docker_configuration() {
  echo "INFO:
  Updating docker configuration
  "

  echo '{
  "experimental": true,
  "storage-driver": "overlay2",
  "max-concurrent-downloads": 50,
  "max-concurrent-uploads": 50
}' | sudo tee /etc/docker/daemon.json
  sudo service docker restart
}

main