This is the example from below link. 
https://kubernetes.io/docs/tutorials/stateful-application/mysql-wordpress-persistent-volume/

In the orginal tutorial, you have to create voulume persistence by yourself. All the scripts in this folder and its subdirectories are customzed to finish the task.

check out this repository:

$ git clone https://github.com/art-niu/kubernetes.git

$ kubectl get nodes
NAME           STATUS   ROLES    AGE   VERSION
controlplane   Ready    master   65m   v1.18.0
node01         Ready    <none>   65m   v1.18.0

$ kubectl describe node controlplane |grep Taints
Taints:             node-role.kubernetes.io/master:NoSchedule

prepare local folders for persistent volumes on respective node (for example, the master node may be tainted wiht NoSchedule, you won't be able to create pod on it.)

in our case, only node01 will be used, run below commands on node01

$ mkdir /home/wp-mysql/wordpress

$ mkdir /home/wp-mysql/mysql


controlplane $ tree wordpress-mysql/
wordpress-mysql/
├── deployment
│   ├── kustomization.yaml
│   ├── mysql-deployment.yaml
│   └── wordpress-deployment.yaml
├── README.md
└── storage
    ├── create-mysql-pvc.yaml
    ├── create-mysql-pv.yaml
    ├── create-wp-pvc.yaml
    ├── create-wp-pv.yaml
    ├── kustomization.yaml
    └── local-storageclass.yaml


replace path in storage/create-mysql-pv.yaml with the folder you created earlier if needed.
  local:
    path: /home/wp-mysql/mysql

replace path in storage/create-wordpress-pv.yaml with the folder you created earlier if needed.
  local:
    path: /home/wp-mysql/wordpress

$ cd storage
$ kubectl apply -k ./

$ cd deployment
$ kubectl apply -k ./
