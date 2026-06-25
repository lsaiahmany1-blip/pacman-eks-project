# Project Screenshots

These screenshots document the validation evidence for the Pac-Man EKS Auto Mode project. Public screenshots should avoid exposing AWS account IDs, IAM principals, ECR registry URLs, public LoadBalancer hostnames, local usernames, hostnames, and local filesystem paths.

| Screenshot | Evidence |
| --- | --- |
| `01-project-structure.png` | Repository layout with Docker, Kubernetes, EKS, documentation, diagrams, and application files. |
| `04-github-project-uploaded.png` | Project source and DevOps assets published to GitHub. |
| `05-aws-cli-connected.png` | AWS CLI identity check with account and IAM details redacted. |
| `06-ecr-repository-created.png` | ECR repository created for the Pac-Man image with account-specific values redacted. |
| `07-docker-push-to-ecr.png` | Docker image push to ECR with registry and local path details redacted. |
| `08-cloudformation-create-complete.png` | EKS-related CloudFormation stack completed successfully. |
| `09-eks-nodes-ready.png` | EKS worker nodes reported as Ready. |
| `10-pods-running.png` | Pac-Man and MongoDB Pods running in Kubernetes. |
| `11-services-loadbalancer.png` | Kubernetes Services and LoadBalancer exposure validated. |
| `12-pacman-running-browser.png` | Pac-Man reachable through the LoadBalancer endpoint, with public endpoint redacted. |
| `13-kubernetes-resources.png` | Deployed Kubernetes resources reviewed after rollout. |
| `14-eks-and-ebs-addon-complete.png` | EKS cluster and EBS CSI add-on creation evidence. |

All cloud resources were removed after validation to avoid ongoing AWS costs.
