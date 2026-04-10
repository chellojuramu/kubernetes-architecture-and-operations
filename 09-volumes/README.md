## Dynamic Provisioning - Tested and Verified ✅

### What I Built
- StorageClass: `roboshop-efs`
- PVC: `efs-dynamic` (auto-bound to PV `pvc-afff500f-3dc9-4b03-8d3c-fc3d2ff4c349`)
- Pod: `efs-app` (nginx serving from EFS)

### AWS Resources Auto-Created
- Access Point ID: `fsap-0663e9d09009134ae`
- Path: `/roboshop/pvc-afff500f-3dc9-4b03-8d3c-fc3d2ff4c349`
- Permissions: `700` (owner-only)

### Test Results
✅ PVC auto-bound (no manual PV creation needed)
✅ Access Point auto-created by StorageClass
✅ Data written: Thu Apr 9 11:18:34 UTC 2026
✅ Pod deleted and recreated
✅ Data persisted with identical timestamp
✅ ReadWriteMany access mode working

### Key Differences from Static
| Aspect | Static (06) | Dynamic (07+08) |
|--------|-------------|-----------------|
| PV | Manual | Auto-created |
| Path | / (root) | /roboshop/pvc-xyz/ |
| Access Point | None | Auto-created per PVC |
| Isolation | Shared | Per-PVC directory |

### Commands That Proved It Worked
```bash
# See auto-created Access Point
aws efs describe-access-points --file-system-id fs-0cecc78b8a3a1c601

# Test persistence
kubectl delete pod efs-app -n volumes
kubectl apply -f 08-efs-dynamic.yaml
kubectl exec -n volumes efs-app -- cat /usr/share/nginx/html/index.html
# Same timestamp = persistence works!
```

### Production Insights
- StorageClass is platform team's responsibility (set once)
- Developers just create PVCs (no AWS knowledge needed)
- Each team/app gets isolated storage automatically
- Much more scalable than static provisioning
