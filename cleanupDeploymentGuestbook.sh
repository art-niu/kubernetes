# Delete Depolyments of Redis  
kubectl delete deployment -l app=redis

# Delete Guestbook Deployment
kubectl delete deployment -l app=guestbook

# Delete service of Guestbook
kubectl delete service -l app=guestbook

# Delete service of Redis
kubectl delete service -l app=redis

# Verify if the resources are released
kubectl get pods
