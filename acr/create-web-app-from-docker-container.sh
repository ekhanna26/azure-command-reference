#!/bin/bash

# Create & Run Web App in a container from ACR registry using Azure CLI

# variables
RG="<your-resource-group-name>"
ACR="<your-acr-name>"

# create new azure container registry
az acr create --resource-group $RG --name $ACR --sku Basic --admin-enabled true

# change the directory to be in the clouddrive in azure command shell
cd /home/cloud/clouddrive

# clone a git repo 
git clone --branch js-docker https://github.com/ekhanna26/simple-web-app.git ./js-docker

# build and push the image to acr registry
az acr build --image js-docker:v1 --registry mycontainer1 --file Dockerfile .

# next steps in azure console: 
#   1. create app service plan and web app
#   2. create web app in azure under app service plan and select to run using docker container image from acr registry

