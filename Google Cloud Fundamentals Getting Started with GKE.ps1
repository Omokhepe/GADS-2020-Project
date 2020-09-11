## LAB: Google Cloud Fundamentals: Getting Started with GKE

## Objectives:

In this lab, you learn how to perform the following tasks:

   - Provision a Kubernetes cluster using Kubernetes Engine.

   - Deploy and manage Docker containers using kubectl.

## Steps:

1. Confirm that needed APIs are enabled

	- To set your Cloud Platform project in this session use “gcloud config set project [PROJECT_ID]”( my PROJECT_ID is qwiklabs-gcp-03-280d9b84a10a )
	
		gcloud config set project qwiklabs-gcp-03-280d9b84a10a
		
	

2. Start a Kubernetes Engine cluster

	- assign the variable MY_ZONE to the zone in the project which is us-central1-a
	
		export MY_ZONE=us-central1-a
		
	- Start a Kubernetes cluster managed by Kubernetes Engine. Name the cluster webfrontend and configure it to run 2 nodes:
		
		gcloud container clusters create webfrontend --zone=$MY_ZONE --num-nodes=2
	
	- check your installed version of Kubernetes using the kubectl version command.
	
		kubectl version
		
	- View your running nodes in cloud shell.
	
		gcloud compute instances list

3. Run and deploy a container
	
	- From your Cloud Shell prompt, launch a single instance of the nginx container. 
	
		kubectl create deploy nginx --image=nginx:1.17.10
	
	- View the pod running the nginx container
	
		kubectl get pods
		
	- Expose the nginx container to the Internet, create a service and an external load balancer with a public IP address
	
		kubectl expose deployment nginx --port 80 --type LoadBalancer
		
	- View the new Service
	
		kubectl get services
	
	- Scale up the number of pods running on the service
		
		kubectl scale deployment nginx --replicas=3
		
	- Confirm that Kubernetes has updated the number of pods
	
		kubectl get pods
		
	- Confirm that the External IP address has not changed
		
		kubectl get services
		