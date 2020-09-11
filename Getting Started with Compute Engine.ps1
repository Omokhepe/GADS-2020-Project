## LAB: Google Cloud Fundamentals: Getting Started with Compute Engine

## Objectives:
   
   In this lab, you will learn how to perform the following tasks:

		- Create a Compute Engine virtual machine using the Google Cloud Platform (GCP) Console.

		- Create a Compute Engine virtual machine using the gcloud command-line interface.

		- Connect between the two instances.
	 
	 
1. Create a Compute Engine virtual machine using the Google Cloud Platform (GCP) Console.

		- I need to first know the list of all zones in the region allocated to me.
			gcloud compute zones list | grep us-central1

		- From the list of zones, select the one suitable for you using 

			gcloud config set compute/zone  us-central1-b 

		- Create a virtual machine using GCP console, execute this command:

			gcloud compute instances create "my-vm-1" --machine-type "n1-standard-1" --image-project "debian-cloud" --image "debian-9-stretch-v20190213" --subnet "default" --tag "http"


2. Create a Compute Engine virtual machine using the gcloud command-line interface.

		- I need to first know the list of all zones in the region allocated to me:
			gcloud compute zones list | grep us-central1

		- From the list of zones, select the one suitable for you using: 

			gcloud config set compute/zone  us-central1-b 

		- Create a virtual machine using GCP console, execute this command:

			gcloud compute instances create "my-vm-2" --machine-type "n1-standard-1" --image-project "debian-cloud" --image "debian-9-stretch-v20190213" --subnet "default" 


3. Connect between the two instances

		- To open a command prompt on the my-vm-2 instance:
			gcloud compute ssh my-vm-2

		- Use the ping command to confirm that my-vm-2 can reach my-vm-1 over the network:
			ping -c 4 my-vm-1
			- The -c 4 command aborts the ping at the fourth line

		- Use the ssh command to open a command prompt on my-vm-1:
			ssh my-vm-1

		- At the command prompt on my-vm-1, install the Nginx web server:
			sudo apt-get install nginx-light -y

		- Use the nano text editor to add a custom message to the home page of the web server:
			sudo nano /var/www/html/index.nginx-debian.html

		- Use the arrow keys to move the cursor to the line just below the h1 header. Add text like this, and replace YOUR_NAME with your name:
			Hi from YOUR_NAME

			Save and close the text editor

		- Confirm that the web server is serving your new page. At the command prompt on my-vm-1, execute this command:
			curl http://localhost/

		- To exit the command prompt on my-vm-1, execute this command:
			exit

		- To confirm that my-vm-2 can reach the web server on my-vm-1, at the command prompt on my-vm-2, execute this command:
			curl http://my-vm-1/

		- To get the external IP of my-vm-1 instance, execute this comman:
			gcloud compute instances list

		- Copy and paste the IP address into a new browser tab and hit enter.



