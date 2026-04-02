# Kubernetes Services — Nginx Demo

## What is This?

This folder demonstrates the three types of Kubernetes Services using
a simple Nginx deployment on a local Kind cluster.

A Service is a stable endpoint that sits in front of Pods and provides:
- A fixed DNS name that never changes even if Pods restart
- Load balancing across multiple Pods
- Different levels of accessibility — internal only or external

## Service Types Covered

| Service | File | Access |
|---|---|---|
| ClusterIP | clusterip.yaml | Inside cluster only — Pod to Pod communication |
| NodePort | nodeport.yaml | Outside cluster via localhost:30001 |
| LoadBalancer | loadbalancer.yaml | Outside cluster via cloud public IP |

---

## Files Overview
```
../06-cluster-setup/kind.yaml       → creates local Kind cluster with port mapping
../05-deployments/deployment.yaml   → creates 3 nginx pods (labels: env=demo, app=nginx)
clusterip.yaml                      → internal only service
nodeport.yaml                       → external access via localhost:30001
loadbalancer.yaml                   → external access via cloud public IP
```

---

## How Services Find Pods

Services do not connect to Pods by name or IP.
They use labels as selectors to find matching Pods automatically.
```
Pod labels:              Service selector:
  env: demo        ←→     env: demo
  app: nginx       ←→     app: nginx

If labels match → Service routes traffic to that Pod
If labels do not match → Endpoints will be empty → no traffic
```

---

## Setup and Run Order

### Step 1 — Create the cluster
```bash
kind create cluster --config ../06-cluster-setup/kind.yaml
```

### Step 2 — Verify cluster is ready
```bash
kubectl get nodes
# wait until all nodes show Ready
```

### Step 3 — Apply Deployment first (pods must exist before Service)
```bash
kubectl apply -f ../05-deployments/deployment.yaml
```

### Step 4 — Verify pods are running
```bash
kubectl get pods -o wide
# wait until all pods show Running
```

### Step 5 — Apply Services
```bash
kubectl apply -f clusterip.yaml
kubectl apply -f nodeport.yaml
```

### Step 6 — Verify everything is running
```bash
kubectl get pods,svc,endpoints -o wide
# check endpoints column — if empty, labels do not match
```

### Step 7 — Test NodePort (external access)
```bash
curl http://localhost:30001
# should return nginx welcome page
```

### Step 8 — Test ClusterIP (internal access via port-forward)
```bash
# terminal 1
kubectl port-forward svc/cluster-svc 8080:80

# terminal 2
curl http://localhost:8080
# should return nginx welcome page
```

---

## Cleanup
```bash
# delete services first
kubectl delete -f clusterip.yaml
kubectl delete -f nodeport.yaml

# delete deployment
kubectl delete -f ../05-deployments/deployment.yaml

# delete cluster
kind delete cluster
```

---

## Key Rules to Remember

- Always create Deployment first — pods must exist before Service can find them
- Services find pods using labels — not by pod name or IP
- If endpoints show empty — your selector labels do not match pod labels
- ClusterIP — internal only, use port-forward for local testing
- NodePort — external access, good for development only
- LoadBalancer — external access with public IP, for production on cloud clusters