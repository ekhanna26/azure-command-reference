# create a virtual network
az network vnet create -g 409-d2fde91e-create-an-aks-cluster-that-uses-azure \
-n myVnet \
--address-prefix 10.0.0.0/16 \
--subnet-name default \
--subnet-prefix 10.0.0.0/21

# get aks credentials
az aks get-credentials -g 409-d2fde91e-create-an-aks-cluster-that-uses-azure -n cluster1

# get nodes
kubectl get nodes

# create deployment using the code editor
code deploy.yaml

# create and apply the deployment using deploy.yaml file
kubectl apply -f deploy.yaml

# get or show the deployment
kubectl get deploy

# show running pods
kubectl get po

# show pods with private ip using wide option
kubectl get po -o wide

# open interactive terminal to login inside the container
kubectl run -it --rm virtual-node-test --image=debian

# apt-get install and update inside the container
apt-get update && apt-get install -y curl

# curl private ip of pod to show its responding
curl -L http://10.0.8.4

