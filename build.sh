#!/bin/bash

# Function to check if Docker is running
check_docker_running() {
    if ! docker version > /dev/null 2>&1; then
        echo "Error: Docker daemon is not running or accessible."
        # Optional: Add steps to start Docker here if on a host OS (e.g., systemctl start docker)
        exit 1
    else
        echo "Success: Docker daemon is running and accessible."
    fi
}

check_docker_running

git submodule update --remote --recursive

docker build --pull --no-cache -t barrettefab/simple-aircraft-manager:latest .

read -p "Push Build to Docker Hub? " -n 1 -r
echo    
if [[ $REPLY =~ ^[Yy]$ ]]
then
  docker push barrettefab/simple-aircraft-manager:latest
fi
