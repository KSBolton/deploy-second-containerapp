# Introduction

This project is an introduction to running containerized applications in AWS, and using Elastic Container Registry (ECR) as the public source of truth for images.
In its current state, the project:

1. Builds the AWS infrastructure (Networking, EC2, ECR, ALB) via Terraform.
1. Builds and pushes the images to ECR via GitHub Actions.
1. Manually (for now!) connects to the EC2 host to pull images from ECR and run the containers.


# Steps (fairly simple)
1. Generate an SSH key pair for the EC2 instance (I named mine 'key' because I'm very imaginative.) The name is hardcode in TF so change it there, as needed.
1. Run the Terraform code to build the underlying infrastructure on AWS. Docker should be installed on the EC2.
1. At EC2 CLI:
    - Login to ECR (aws ecr get-login-password --region <region> | docker login -u AWS <ECR URI> --password-stdin
    - Create a custom bridge network to allow name resolution among containers.
    - Run the mysqldb container first - it may need a couple seconds to listen on its ports.
    - Run as many webapp containers as you wish, so long as they use these environment variables:
        - DBHOST (the DB container), DBPORT (usually 3306), APP_COLOR, DBPWD
1. The Terraform code returns the repositories' URL, the IP address of the EC2 instance, and the FQDN of the ALB.        
