# Screenshots to Capture

Create one screenshot per item and save it in this folder with the suggested filename.

1. `01-github-repository.png` - GitHub repository root showing source code, `Dockerfile`, `eksctl/`, `kubernetes/`, `.github/workflows/`, `diagrams/`, and `screenshots/`.
2. `02-github-actions-success.png` - Successful GitHub Actions workflow run for `CI/CD`.
3. `03-ecr-repository.png` - Amazon ECR repository named `pacman` with the pushed image tag.
4. `04-eks-cluster-overview.png` - EKS cluster overview showing cluster name `pacman-eks-auto`.
5. `05-eks-auto-mode.png` - EKS Auto Mode enabled view or cluster compute settings showing Auto Mode.
6. `06-kubectl-pods.png` - Terminal output of `kubectl get pods -n pacman -o wide`.
7. `07-kubectl-services.png` - Terminal output of `kubectl get svc -n pacman`, showing the external NLB hostname for the `pacman` service.
8. `08-mongodb-statefulset.png` - Terminal output of `kubectl get statefulset,pvc,pv -n pacman`, showing MongoDB and persistent storage.
9. `09-nlb-console.png` - AWS EC2 Load Balancers page showing the Network Load Balancer created by the Kubernetes Service.
10. `10-pacman-browser.png` - Browser opened to the NLB DNS name showing the Pac-Man game.
11. `11-cleanup-start.png` - Terminal showing cleanup commands before deletion, if your instructor requires cleanup evidence.
12. `12-cleanup-complete.png` - Terminal or AWS console showing cluster/load balancer resources removed, if your instructor requires cleanup evidence.
