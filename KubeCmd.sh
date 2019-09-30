#!/bin/sh

# Start minikube
echo "Starting MiniKube and setting max pods to 5..."
minikube start --extra-config=kubelet.MaxPods=5

# Set docker env
echo "Setting Docker environment..."
eval $(minikube docker-env)

# Build image (increment value if needed)
echo "Building Docker Image..."
docker build -t al-helloworld:0.0.1 .

# Run in minikube using the local image (image-pull-policy)
echo "Running container into MiniKube..."
kubectl run al-helloworld --image=al-helloworld:0.0.1 --port=1512 --image-pull-policy=Never

# Expose the deployment
echo "Exposing deployment..."
kubectl expose deployment al-helloworld --type=LoadBalancer
sleep 5

# Check that it's running
echo "Confirming pods have deployed..."
kubectl get pods
sleep 2

# Get url
echo "The container's url is:"
minikube service helloapp --url
sleep 15

# Test scaling works
echo "Scaling up for testing..."
kubectl scale deployment al-helloworld --replicas=4;
sleep 5
# Scales up the pods to 4 replicas
echo "Did scaling work?"
kubectl get pods
sleep 3
# Outputs the pods to display whether the scaling worked
echo "Scaling back down..." 
kubectl scale deployment al-helloworld --replicas=1;
sleep 5
echo "Did scaling work?"
kubectl get pods
sleep 3
echo "All done! Go ahead and delete the app using the following command when you are ready:"
sleep 1
echo "kubectl delete deployments,svc al-helloworld"
