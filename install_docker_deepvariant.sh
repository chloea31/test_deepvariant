#!/bin/bash

sudo docker image list
ls -la /var/run/docker.sock
sudo usermod -a -G docker "$USER"
groups

## close terminal VSCode, then open a new terminal CMD and type wsl --shutdown
## Re-open VSCode: it should start again
groups ## you should see docker at the last place
docker image list