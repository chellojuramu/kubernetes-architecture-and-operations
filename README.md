# Kubernetes Architecture and Operations

A hands-on Kubernetes learning repository covering core concepts
through real YAML examples and practical exercises.

This repo is structured for anyone who wants to learn Kubernetes
from scratch — from basic Pod concepts to production-level patterns.

---

## How to Use This Repo

Each folder is a self-contained topic with working YAML files.
Follow the folder numbers in order for the best learning experience.
```
01-pods/                    → start here
02-namespaces/
03-configmaps-and-secrets/
04-services/
05-deployments/
06-cluster-setup/
...more topics being added
```

Clone the repo and apply any YAML directly to your cluster:
```bash
git clone https://github.com/chellojuramu/kubernetes-architecture-and-operations
cd kubernetes-architecture-and-operations

# apply any example
kubectl apply -f 01-pods/simple-pod.yaml
```

---

## Prerequisites

- kubectl installed
- A running Kubernetes cluster — Kind (local) or AKS (cloud)

To create a local cluster using Kind:
```bash
kind create cluster --config 06-cluster-setup/kind.yaml
kubectl get nodes
```

---

## Topics Covered

This repo is actively growing. New topics and YAML examples
are added regularly as the learning progresses.

Current topics and many more being added:

- Pod fundamentals and multi-container patterns
- Namespaces and resource isolation
- ConfigMaps and Secrets
- Services — ClusterIP, NodePort, LoadBalancer
- Deployments, rolling updates, rollback
- Storage — PV, PVC, StorageClass
- RBAC and security
- Autoscaling — HPA, VPA, KEDA
- Helm and Kustomize
- Observability — Prometheus, Grafana, Loki
- GitOps with ArgoCD
- AKS production patterns

---

## Connect and Learn More

If this repo helped you, connect with me on LinkedIn for
in-depth PDFs, notes, and content on Kubernetes, DevOps,
and Cloud topics posted regularly.

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Ramu%20Chelloju-blue?style=flat&logo=linkedin)](https://www.linkedin.com/in/ramuchelloju/)

**Follow for:**
- Deep dive Kubernetes PDFs
- DevOps and Cloud notes
- Hands-on learning content
- Interview preparation guides

---

## License

This project is open source and available under the
[MIT License](LICENSE).