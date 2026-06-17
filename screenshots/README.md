# Project Screenshots

These screenshots document the successful deployment of the Pac-Man application on Amazon EKS Auto Mode.

The folder currently contains the following screenshot files:

- `01-project-structure.png`
- `04-github-project-uploaded.png`
- `05-aws-cli-connected.png`
- `06-ecr-repository-created.png`
- `07-docker-push-to-ecr.png`
- `08-cloudformation-create-complete.png`
- `09-eks-nodes-ready.png`
- `10-pods-running.png`
- `11-services-loadbalancer.png`
- `12-pacman-running-browser.png`
- `13-kubernetes-resources.png`
- `14-eks-and-ebs-addon-complete.png`

## 01-project-structure.png
Shows the complete project structure including Docker configuration, Kubernetes manifests, EKS configuration, documentation, architecture diagrams, and application source code.

## 04-github-project-uploaded.png
Shows the GitHub repository containing the full project source code, infrastructure files, deployment manifests, and documentation.

## 05-aws-cli-connected.png
Shows successful AWS CLI authentication using the IAM user `devops-admin` and verification through the `aws sts get-caller-identity` command.

## 06-ecr-repository-created.png
Shows the Amazon Elastic Container Registry (ECR) repository created to store the Pac-Man Docker image.

## 07-docker-push-to-ecr.png
Shows the Docker image successfully pushed to Amazon ECR and ready for deployment to Amazon EKS.

## 08-cloudformation-create-complete.png
Shows the CloudFormation stack creation process completed successfully during EKS cluster provisioning.

## 09-eks-nodes-ready.png
Shows Amazon EKS worker nodes in the Ready state, confirming that the Kubernetes cluster is operational.

## 10-pods-running.png
Shows the Pac-Man application Pods and MongoDB Pod running successfully inside the Kubernetes cluster.

## 11-services-loadbalancer.png
Shows Kubernetes Services including the AWS LoadBalancer used to expose the application to the internet.

## 12-pacman-running-browser.png
Shows the Pac-Man application successfully accessed through the public AWS LoadBalancer endpoint.

## 13-kubernetes-resources.png
Shows all deployed Kubernetes resources including Pods, Services, Deployments, ReplicaSets, and StatefulSets.

## 14-eks-and-ebs-addon-complete.png
Shows successful creation of both the Amazon EKS cluster and the AWS EBS CSI Driver add-on through CloudFormation. The current Kubernetes manifests do not use EBS-backed MongoDB persistence.

## Project Summary

This project demonstrates a complete DevOps workflow:

- Source code management with GitHub
- Containerization using Docker
- Image management with Amazon ECR
- Kubernetes deployment on Amazon EKS Auto Mode
- Application exposure through AWS LoadBalancer
- MongoDB StatefulSet deployment using `emptyDir` storage for demo data
- Infrastructure management using eksctl
- Validation, monitoring, and cleanup of AWS resources

All AWS resources were deleted after successful validation to avoid unnecessary cloud costs.
