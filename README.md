# Kubernetes Architecture and Operations

[![Kubernetes](https://img.shields.io/badge/Kubernetes-326CE5?style=for-the-badge&logo=kubernetes&logoColor=white)](https://kubernetes.io/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](LICENSE)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/ramuchelloju/)

A hands-on Kubernetes learning repository covering **core concepts to production patterns** through real YAML manifests and practical exercises. Perfect for **CKA preparation**, DevOps engineers, and anyone building production-ready Kubernetes skills.

---

## 🎯 What's Inside

This repository takes you from Kubernetes fundamentals to advanced deployment patterns:

- ✅ **Core Concepts** — Pods, Services, Deployments, ConfigMaps, Secrets
- ✅ **Storage & Persistence** — Volumes, PersistentVolumes, StorageClass
- ✅ **Advanced Scheduling** — Node Affinity, Taints & Tolerations, Pod Affinity
- ✅ **Workload Types** — StatefulSets, DaemonSets, Jobs, CronJobs
- ✅ **Security & Access Control** — RBAC, IAM integration (EKS)
- ✅ **Production Networking** — Ingress Controllers, AWS Load Balancer integration, SSL/TLS
- ✅ **Multi-Container Patterns** — Sidecar, Ambassador, Adapter

---

## 📂 Repository Structure

Each folder is a **self-contained learning module** with working manifests. Follow the numbered sequence for the best learning experience.
kubernetes-architecture-and-operations/
│
├── 01-pods/                      # Pod fundamentals, lifecycle, multi-container
├── 02-namespaces/                # Resource isolation and quotas
├── 03-configmaps-and-secrets/    # Configuration management
├── 04-services/                  # ClusterIP, NodePort, LoadBalancer
├── 05-deployments/               # Rolling updates, rollbacks, scaling
├── 06-cluster-setup/             # Kind/EKS cluster configurations
├── 07-sets/                      # StatefulSets, DaemonSets, Jobs
├── 08-multi-container/           # Sidecar and multi-container patterns
├── 09-volumes/                   # PV, PVC, StorageClass, CSI drivers
├── 10-NodeSelector/              # Basic node scheduling
├── 11-node-affinity/             # Advanced pod placement
├── 11a-pod-affinity/             # Pod affinity and anti-affinity
├── 12-taints-and-tolerations/    # Node isolation strategies
├── 13-headless-service/          # Service discovery without load balancing
├── 14-RBAC/                      # Role-Based Access Control + IAM
├── 15-Ingress/                   # AWS Load Balancer Controller, shared ALB
│   ├── app1/                     # Sample app with Ingress
│   ├── app2/                     # Multi-app shared ALB demo
│   └── eksctl/                   # EKS OIDC and controller setup
│
└── README.md
---

## 🚀 Quick Start

### Prerequisites

- **kubectl** installed ([Guide](https://kubernetes.io/docs/tasks/tools/))
- A running Kubernetes cluster (Kind, Minikube, EKS, or AKS)

### Setup Local Cluster (Kind)

```bash
# Create a local cluster
kind create cluster --config 06-cluster-setup/kind.yaml --name k8s-learning

# Verify
kubectl get nodes
```

### Clone and Run

```bash
# Clone the repository
git clone https://github.com/chellojuramu/kubernetes-architecture-and-operations.git
cd kubernetes-architecture-and-operations

# Start with basics
cd 01-pods
kubectl apply -f simple-pod.yaml

# Watch it run
kubectl get pods --watch
```

### Example: Deploy with Ingress

```bash
# Navigate to Ingress example
cd 15-Ingress/app1

# Review the manifest
cat manifest.yaml

# Apply to cluster
kubectl apply -f manifest.yaml

# Verify deployment
kubectl get pods,svc,ingress

# Check application
kubectl logs -l component=app1
```

---

## 📚 Learning Path

### **Beginner** (Week 1-2)
- Start with `01-pods` through `05-deployments`
- Master core concepts: Pods, Services, Deployments
- Understand configuration with ConfigMaps and Secrets

### **Intermediate** (Week 3-4)
- Explore `09-volumes` for persistent storage
- Learn scheduling with `10-NodeSelector`, `11-node-affinity`
- Understand workload isolation with `12-taints-and-tolerations`

### **Advanced** (Week 5-6)
- Dive into `14-RBAC` for security and access control
- Master production networking with `15-Ingress`
- Explore StatefulSets and advanced patterns in `07-sets`

---

## 🏗️ Production Highlights

### AWS Load Balancer Controller (15-Ingress)

Real-world Ingress setup demonstrating:
- **Cost Optimization** — Multiple apps share one ALB (saves $$$)
- **SSL/TLS Termination** — ACM certificate integration
- **Host-Based Routing** — Route by domain name
- **Target Type: IP** — Direct pod IP registration (lower latency)
- **IRSA** — IAM Roles for Service Accounts (zero hardcoded credentials)

**Architecture:**

Internet → Route53 → ALB → Target Groups → Pod IPs
├── app1.servicewiz.in → TG1 → app1 pods
└── app2.servicewiz.in → TG2 → app2 pods

### RBAC with EKS (14-RBAC)

Production access control covering:
- Kubernetes RBAC (Roles, RoleBindings, ClusterRoles)
- EKS IAM integration via `aws-auth` ConfigMap
- IRSA for pod-level AWS permissions
- Real-world security patterns

---

## 🛠️ Technologies Used

- **Container Runtime:** Docker, containerd
- **Cluster Management:** Kind, eksctl, Terraform
- **Cloud Providers:** AWS (EKS), Azure (AKS)
- **Networking:** AWS VPC CNI, CoreDNS
- **Ingress:** AWS Load Balancer Controller
- **Storage:** EBS CSI Driver, StorageClass

---

## 💡 Connect & Learn More

Follow me on **LinkedIn** for:
- 📄 Deep-dive Kubernetes PDFs and diagrams
- 🛠️ DevOps & SRE production patterns
- ☁️ AWS/Azure architecture guides
- 📚 CKA/CKAD interview prep content
- 🚀 Weekly hands-on learning posts

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Ramu%20Chelloju-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/ramuchelloju/)
[![GitHub](https://img.shields.io/badge/GitHub-chellojuramu-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/chellojuramu)

**Coming Soon:** *Kubernetes in Production* — A comprehensive handbook covering 47 real-world scenarios

---

## ⭐ Show Your Support

If this repository helped you:
- ⭐ **Star it** to bookmark for later
- 🍴 **Fork it** to customize your learning
- 📢 **Share it** with others preparing for CKA
- 💬 **Open an issue** for questions or suggestions

---

## 🤝 Contributing

Contributions are welcome! Found a bug or want to add an example?

1. Fork the repo
2. Create a feature branch (`git checkout -b feature/new-example`)
3. Commit changes (`git commit -m 'Add new example'`)
4. Push to branch (`git push origin feature/new-example`)
5. Open a Pull Request

---

## 📄 License

This project is licensed under the **MIT License** — see the [LICENSE](LICENSE) file for details.

---

<div align="center">

**Built with ❤️ by [Ramu Chelloju](https://www.linkedin.com/in/ramuchelloju/) | DevOps Engineer**

*Documenting the journey from learning to production*

</div>