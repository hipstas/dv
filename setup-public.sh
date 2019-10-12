#!/bin/bash

# stop any previously running containers
docker container stop dvt_public
docker container prune -f

# Install the image
docker build -t dvt-public - < Dockerfile.public

# Start the image (probably need to change the -v and -w tags)
docker run  \
    --name dvt_public \
    -v /home/taylor:/home/taylor \
    -w /home/taylor \
    --env DOCKER_IMG=dvt_public \
    -td dvt-public

# Then, open a shell in the new image and copy the next set of command
# command directly into the terminal

# docker exec -it dvt_public bash
