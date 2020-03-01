# Deploy Example to kubernetes
# https://kubernetes.io/docs/tutorials/stateless-application/guestbook/
kubectl apply -f https://k8s.io/examples/application/guestbook/redis-master-deployment.yaml

# Query Created Pods
kubectl get pods

# Apply Redis Master Service
kubectl apply -f https://k8s.io/examples/application/guestbook/redis-master-service.yaml

# Verify serverice creation
kubectl get service

# Apply Redis Slave Deployment
kubectl apply -f https://k8s.io/examples/application/guestbook/redis-slave-deployment.yaml

# Apply Redis Slave Service
kubectl apply -f https://k8s.io/examples/application/guestbook/redis-slave-service.yaml

# Apply Frontend Deployment
 kubectl apply -f https://k8s.io/examples/application/guestbook/frontend-deployment.yaml
 
# Apply Frontend Service
kubectl apply -f https://k8s.io/examples/application/guestbook/frontend-service.yaml

# Query Frontend Service IPs
kubectl get service frontend

# Below commands can be used to scale out number of Frontend pods
# kubectl scale deployment frontend --replicas=5

# Below commands can be used to scale in number of Frontend pods
# kubectl scale deployment frontend --replicas=2
