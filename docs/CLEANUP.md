# Cleanup Instructions

These commands delete AWS resources created by this project. Run them only when you are ready to remove the deployment.

## 1. Delete Kubernetes Workloads

```bash
kubectl delete -k kubernetes
```

Check that the Network Load Balancer has been removed:

```bash
kubectl get svc -n pacman
aws elbv2 describe-load-balancers --region us-east-1
```

## 2. Verify MongoDB Storage Cleanup

The current MongoDB StatefulSet uses `emptyDir` storage. It does not create PersistentVolumeClaims or EBS-backed PersistentVolumes.

After deleting the Kubernetes workloads, verify that no project PersistentVolumes or PersistentVolumeClaims remain:

```bash
kubectl get pvc -n pacman
kubectl get pv
```

If the MongoDB manifest is changed in the future to use EBS-backed PersistentVolumes, inspect any remaining PVs before deleting them manually.

## 3. Delete the EKS Cluster

```bash
eksctl delete cluster -f eksctl/cluster.yaml
```

## 4. Delete the ECR Repository

This removes pushed container images.

```bash
aws ecr delete-repository \
  --repository-name pacman-eks \
  --region us-east-1 \
  --force
```

## 5. Verify No Project Resources Remain

```bash
aws eks list-clusters --region us-east-1
aws ecr describe-repositories --region us-east-1
aws elbv2 describe-load-balancers --region us-east-1
aws ec2 describe-volumes \
  --region us-east-1 \
  --filters Name=tag:project,Values=pacman-eks-final
```
