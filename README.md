# Python flavoured Hello World application

This repo houses a simple python application that produces a hello world page when ran and navigating to localhost:1512
This is then packaged into a Docker container via the use of the dockerfile (which I've gone and pushed this to my dockerhub repo ahead of time for the app.yaml).
The yaml file is a k8s file which creates a simple deployment that's loadbalanced with 2 replicas and that can be ran using the following command:  
```bash
kubectl create -f app.yaml
```

I have also created a file in the repo call KubeCmd.sh which runs through the entire process of starting minikube, building the image locally, runing it in minikube, exposes the service to loadbalancing, displays the url which the app can be accessed at and does some example scaling displaying the results.

To delete the stack run if you run the shell:  
```bash
kubectl delete deployments,svc al-helloworld
```

## Requirements
Docker

Minikube
Python

## Repo contents
- hello-world.py - Python flavored hello world application that runs on port 1512
- requirements.txt - requirements for external dependancies for the python script (aiohttp)
- Dockerfile - Docker container template for creating the al-helloworld container
- app.yaml - Kubernetes deployment template for the containerised application (al-helloworld)
- KubeCmd.sh - Bash script to run through the entire process of building and packaging the app into a container and running via minikube

## License
[MIT](https://choosealicense.com/licenses/mit/)