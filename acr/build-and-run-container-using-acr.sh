# Build and Run Container with ACR Task using Azure CLI

# variables
RG="<your-resource-group-name>"
ACR="<your-acr-name>"

# create new azure container registry
az acr create --resource-group $RG --name $ACR --sku Basic --admin-enabled true

# change the directory to be in the clouddrive in azure command shell
cd /home/cloud/clouddrive

# create a simple Dockerfile using the hello-world image
echo "FROM hello-world" > Dockerfile

# build and push the image to acr registry
az acr build --image sample/hello-world:v1 --registry mycontainer1 --file Dockerfile .

# run the container
az acr run --registry mycontainer1 --cmd '$Registry/sample/hello-world:v1' /dev/null 
