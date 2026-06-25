# Pac-Man on Amazon EKS Auto Mode

Portfolio project showing how a Node.js Pac-Man application can be containerized, pushed to Amazon ECR, deployed to Amazon EKS Auto Mode, exposed through an AWS LoadBalancer, and validated with Kubernetes CLI checks.

This repository is kept as a documented learning project. A newer automation-focused version of the same workload is available in the follow-up repository, `2-automation`.

## Highlights

- Built a production Docker image for a Node.js application.
- Published the image to Amazon ECR.
- Provisioned an EKS Auto Mode cluster with `eksctl`.
- Deployed the application and MongoDB with Kubernetes manifests.
- Exposed the application through an AWS LoadBalancer.
- Added GitHub Actions workflows for CI validation and a manual AWS deployment reference.
- Documented validation screenshots and cleanup steps.

## Technologies Used

| Area | Tools |
| --- | --- |
| Cloud | AWS, Amazon EKS Auto Mode, Amazon ECR, IAM, CloudFormation, AWS Load Balancer |
| Containers | Docker, ECR image registry |
| Kubernetes | Deployments, Services, StatefulSets, ConfigMaps, StorageClass manifests |
| CI/CD | GitHub Actions |
| CLI tooling | `aws`, `eksctl`, `kubectl`, Git |

## Architecture

```text
Developer
  |
  v
GitHub Repository
  |
  v
Docker Build
  |
  v
Amazon ECR
  |
  v
Amazon EKS Auto Mode
  |
  +--> Pac-Man Deployment, 2 replicas
  |
  +--> MongoDB StatefulSet
  |
  v
AWS LoadBalancer
  |
  v
User Browser
```

MongoDB uses `emptyDir` storage in this version, so database data is treated as demo data and is not persistent after Pod recreation. Persistent EBS-backed storage is listed under future improvements and is implemented in the newer automation project.

## Repository Structure

```text
.github/workflows/      GitHub Actions CI and manual deployment workflows
docker/                 Original development Docker assets
docs/                   Project notes and cleanup documentation
eksctl/                 EKS Auto Mode cluster configuration
kubernetes/             Kubernetes namespace, app, database, service, and storage manifests
screenshots/            Redacted validation evidence
diagrams/               Architecture diagram source
Dockerfile              Container image definition
README.md               Portfolio documentation
```

## CI/CD Flow

The active workflow, `.github/workflows/main.yml`, is a no-cost CI/CD demonstration that can run without AWS credentials:

1. Checkout repository code.
2. Verify required project files and directories.
3. Install Node.js dependencies.
4. Build the Docker image locally.
5. Simulate the deployment stage and print the production deployment flow.

The repository also includes `.github/workflows/ci-cd.yml` as a manual AWS deployment reference. That workflow shows how the project can authenticate to AWS using GitHub OIDC, create or use ECR, build and push an image, update kubeconfig, and apply Kubernetes manifests to EKS.

## Kubernetes Deployment

The Kubernetes manifests deploy:

- Namespace: `pacman`
- Pac-Man web application Deployment with two replicas
- MongoDB StatefulSet for demo database storage
- ConfigMap-based application configuration
- LoadBalancer Service for public access
- StorageClass manifest used during the original EBS CSI exploration

The public image value in `kubernetes/pacman-deployment.yaml` is intentionally a placeholder:

```text
IMAGE_URI_PLACEHOLDER
```

During a real deployment, the CI/CD workflow renders this value with the ECR image URI produced by the build.

## Validation Evidence

Screenshots in `screenshots/` show:

- Repository structure
- AWS CLI identity validation with account details redacted
- ECR repository creation with account details redacted
- Docker image push to ECR with registry details redacted
- CloudFormation stack completion
- EKS nodes in Ready state
- Running Kubernetes Pods and Services
- Pac-Man reachable through the LoadBalancer endpoint with endpoint details redacted

## Troubleshooting

Useful checks during deployment:

```bash
aws sts get-caller-identity
aws ecr describe-repositories
eksctl get cluster --region "$AWS_REGION"
kubectl get nodes -o wide
kubectl get pods -n pacman -o wide
kubectl get svc -n pacman -o wide
kubectl describe deployment pacman -n pacman
kubectl logs deployment/pacman -n pacman --tail=100
```

Common issues handled during the project:

- AWS CLI authentication and IAM permissions
- Docker login to ECR
- Kubernetes image reference mismatches
- EKS node scheduling checks
- LoadBalancer hostname availability
- MongoDB storage behavior in a demo environment

## Cleanup

All AWS resources created during validation were removed to avoid ongoing cloud charges.

Typical cleanup commands:

```bash
kubectl delete -k kubernetes
eksctl delete cluster --name "$EKS_CLUSTER_NAME" --region "$AWS_REGION"
aws ecr delete-repository --repository-name "$ECR_REPOSITORY" --region "$AWS_REGION" --force
```

After cleanup, verify that no project resources remain:

```bash
eksctl get cluster --region "$AWS_REGION"
aws ecr describe-repositories --region "$AWS_REGION"
```

## Security Notes

- No AWS access keys, GitHub tokens, kubeconfig files, private keys, `.env` files, or Terraform state files are intentionally stored in this repository.
- Screenshots are redacted before public sharing.
- AWS account IDs, IAM identities, ECR registry URLs, public endpoints, local usernames, hostnames, and local paths should not be exposed in portfolio screenshots.

## Future Improvements

- Replace demo `emptyDir` storage with EBS-backed PersistentVolumeClaims.
- Add HTTPS/TLS through Ingress or AWS Load Balancer Controller.
- Add Prometheus/Grafana monitoring.
- Add centralized logging.
- Add Kubernetes Secrets or external secret management for database credentials.
- Add Helm or Kustomize overlays for multiple environments.
