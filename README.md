# Pac-Man on Amazon EKS Auto Mode

## Project Overview

This project demonstrates a DevOps deployment workflow using AWS cloud services, Docker, Kubernetes, and GitHub.

The goal was to deploy the open-source Pac-Man application to Amazon EKS Auto Mode, expose it to the internet through an AWS LoadBalancer, connect it to MongoDB, document the deployment process, and manage the cluster configuration with infrastructure-as-code style files.

The project was deployed, validated, documented, and later cleaned up to avoid unnecessary AWS costs.

---

## Technologies Used

### Cloud

- Amazon Web Services (AWS)
- Amazon EKS Auto Mode
- Amazon ECR
- AWS IAM
- AWS CloudFormation
- AWS Load Balancer

### Containers

- Docker
- Amazon Elastic Container Registry (ECR)

### Kubernetes

- Amazon EKS
- Deployments
- Services
- StatefulSets
- ConfigMaps
- Storage Classes

### Development Tools

- Git
- GitHub
- GitHub Actions
- eksctl
- kubectl
- AWS CLI
- WSL Ubuntu

---

## Architecture

1. Source code stored in GitHub.
2. Docker image built from the application source code.
3. Container image pushed to Amazon ECR.
4. Amazon EKS Auto Mode cluster provisioned using eksctl.
5. Kubernetes Deployment running two Pac-Man application replicas.
6. MongoDB deployed as a StatefulSet using `emptyDir` storage for this demo.
7. AWS LoadBalancer exposing the application to the internet.

> Note: The current MongoDB manifest uses `emptyDir` storage. Data is not persisted if the MongoDB Pod is recreated. Persistent EBS-backed storage is listed as a future improvement.

---

## Deployment Process

### Step 1 - AWS Configuration

Configured AWS CLI using an IAM user and verified connectivity using:

```bash
aws sts get-caller-identity
```

### Step 2 - Create ECR Repository

Created an Amazon ECR repository for storing Docker images.

### Step 3 - Build Docker Image

Built the Pac-Man application container image locally.

### Step 4 - Push Image to ECR

Authenticated Docker against Amazon ECR and pushed the image successfully.

### Step 5 - Create EKS Cluster

Created an Amazon EKS Auto Mode cluster using eksctl.

### Step 6 - Configure Kubernetes

Applied Kubernetes manifests including:

- Namespace
- Deployment
- Service
- StatefulSet
- ConfigMap
- StorageClass

### Step 7 - Deploy MongoDB

Configured and deployed MongoDB using a StatefulSet. In the current manifests, MongoDB uses `emptyDir` storage for demo data instead of a PersistentVolumeClaim.

### Step 8 - Expose Application

Created a LoadBalancer Service and obtained a public endpoint.

### Step 9 - Validation

Verified:

- Nodes Ready
- Pods Running
- Services Available
- MongoDB Running
- Public Access Working

### Step 10 - Cleanup

Deleted all AWS resources after successful validation and documentation.

---

## CI/CD Pipeline

The repository includes a GitHub Actions CI/CD demonstration workflow at `.github/workflows/main.yml`.

The workflow runs automatically on every push to the `main` branch and can also be started manually from the GitHub Actions tab.

The current workflow demonstrates CI/CD concepts without requiring active AWS resources, AWS credentials, GitHub Secrets, Amazon ECR, or an Amazon EKS cluster.

The pipeline performs the following steps:

- Install Node.js dependencies.
- Verify the expected repository structure.
- Build a Docker image locally using the project `Dockerfile`.
- Simulate a deployment step with clear logging output.

The deployment simulation represents the CD stage of the pipeline. It prints the image tag that would be promoted and explains the production deployment steps without connecting to AWS.

A production version of this workflow could be extended to:

- Authenticate to AWS using GitHub OIDC.
- Push the Docker image to Amazon ECR.
- Update the Pac-Man Kubernetes Deployment image.
- Apply the Kubernetes manifests to Amazon EKS.
- Wait for the deployment rollout to complete.

The repository also keeps `.github/workflows/ci-cd.yml` as a manual AWS deployment reference workflow. It is not triggered automatically on push, so the main CI/CD demonstration can run successfully without AWS configuration.

The deployment documented in the screenshots was validated through AWS, Docker, ECR, eksctl, and kubectl.

---

## Challenges Solved

- AWS CLI authentication issues
- Docker integration issues inside WSL
- ECR authentication and image push problems
- Kubernetes image reference errors
- MongoDB storage configuration issues
- EBS CSI Driver installation
- Kubernetes scheduling problems
- LoadBalancer validation

---

## Deployment Evidence

Deployment screenshots are available in:

```text
screenshots/
```

The screenshots document:

- Project structure
- GitHub repository
- AWS CLI authentication
- ECR repository creation
- Docker image push
- CloudFormation deployment
- EKS nodes
- Kubernetes pods
- Services and LoadBalancer
- Running Pac-Man application
- Kubernetes resources
- EKS add-ons

---

## Project Results

Successfully achieved:

- Docker containerization
- AWS ECR integration
- Amazon EKS deployment
- Kubernetes orchestration
- MongoDB deployment with demo `emptyDir` storage
- Public application access
- Infrastructure documentation
- GitHub version control
- AWS resource cleanup

---

## Cleanup

All AWS resources were removed after project completion to prevent ongoing charges.

Resources deleted:

- EKS Cluster
- EBS CSI Add-on
- Load Balancer
- ECR Repository

Verification was performed to confirm that no active EKS clusters or ECR repositories remained.

---

## Future Improvements

- Persistent EBS-backed MongoDB storage
- HTTPS/TLS with Ingress
- Prometheus/Grafana monitoring
- Centralized logging
- Kubernetes Secrets
- Helm charts
- Backup and restore strategy

---

## Repository Structure

```text
.github/
docker/
docs/
eksctl/
kubernetes/
screenshots/
diagrams/
```

---

## Author

Isaiah Yarchi

DevOps Final Project

AWS - Docker - Kubernetes - GitHub - EKS - ECR
