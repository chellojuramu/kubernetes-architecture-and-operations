# Kubernetes Services — Nginx Demo (Kind Cluster)

## Files Overview

../06-cluster-setup/kind.yaml  → creates the cluster (nodes + port mapping)
../05-deployments/deployment.yaml → creates 3 nginx pods with labels env=demo, app=nginx
nodeport.yaml      → finds pods (env=demo + app=nginx) → opens localhost:30001
clusterip.yaml     → finds pods (env=demo + app=nginx) → internal access only
loadbalancer.yaml  → finds pods (env=demo + app=nginx) → external public IP


## Setup and Run Order

### Step 1 — Create the cluster first
kind create cluster --config ../06-cluster-setup/kind.yaml

### Step 2 — Verify cluster is ready
kubectl get nodes

### Step 3 — Apply Deployment (creates pods first)
kubectl apply -f deployment.yaml

### Step 4 — Verify pods are running
kubectl get pods -o wide

### Step 5 — Apply NodePort Service
kubectl apply -f nodeport.yaml

### Step 6 — Apply ClusterIP Service
kubectl apply -f clusterip.yaml

### Step 7 — Verify everything is running
kubectl get pods,svc,endpoints -o wide

### Step 8 — Test NodePort
curl http://localhost:30001

### Step 9 — Test ClusterIP via port-forward
kubectl port-forward svc/cluster-svc 8080:80
# in another terminal
curl http://localhost:8080

---

## Cleanup Order

# delete services first
kubectl delete -f nodeport.yaml
kubectl delete -f clusterip.yaml

# delete deployment
kubectl delete -f deployment.yaml

# delete cluster
kind delete cluster

---

## Rules to Remember

- Always create Deployment first — pods must exist before Service finds them
- Then create Services — they find pods using labels
- Delete Services first — then Deployment — then cluster
```

