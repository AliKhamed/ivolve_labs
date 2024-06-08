## Lab11 Description 

Container Orchestration with Kubernetes Operators Objective: what is k8s operator? Deploy ArgoCD, ELK using Operators. Explore the capabilities of Operators for application lifecycle management.


### What is k8s operator?

A Kubernetes Operator is a method of packaging, deploying, and managing a Kubernetes application. It uses custom resources (CRs) to extend the Kubernetes API and manage complex stateful applications on Kubernetes. Operators are built with automation in mind, allowing them to handle tasks like provisioning, configuration, scaling, and updates for your applications.

### Steps 

1. **Deploy ArgoCD using Operators**

2. **Deploy ELK using Operators**




## 1. Deploy ArgoCD using Operators on minikube 

### First 

  #### start minikube 
  #### Create argocd namespace 
  #### Add helm repo to argocd operator 

  ```
  helm repo add argo https://argoproj.github.io/argo-helm
  helm repo update

  ```

### Create ArgoCD operator

  ```
  helm install argocd-operator argo/argo-cd -n argocd

  ```
    ![](https://github.com/AliKhamed/ivolve_labs/blob/main/oc/lab11/screenshots/argo1.png)

    ![](https://github.com/AliKhamed/ivolve_labs/blob/main/oc/lab11/screenshots/argo2.png)



### Expose argocd service by run port forward to argocd service


  ```
    kubectl port-forward service/argocd-operator-server -n argocd 8080:443

  ```
  ![](https://github.com/AliKhamed/ivolve_labs/blob/main/oc/lab11/screenshots/port1.png)

  ![](https://github.com/AliKhamed/ivolve_labs/blob/main/oc/lab11/screenshots/port2.png)


### Login by admin on ArgoCD console and get password by the following command 

  ```
  kubectl get secret argocd-initial-admin-secret -n argocd -o jsonpath="{.data.password}" | base64 --decode

  ```
  
  ![](https://github.com/AliKhamed/ivolve_labs/blob/main/oc/lab11/screenshots/pass1.png)

  ![](https://github.com/AliKhamed/ivolve_labs/blob/main/oc/lab11/screenshots/pass2.png)

### Delete Argocd operator using one command

  ```
   helm delete argocd-operator -n argocd

  ```

  ![](https://github.com/AliKhamed/ivolve_labs/blob/main/oc/lab11/screenshots/delete.png)




## 2. Deploy ELK using Operators on minikube


### First 

  #### start minikube 
  #### Create elastic-system namespace 
  #### Add helm repo to elk operator 

  ```
   helm repo add elastic https://helm.elastic.co
   helm repo update

  ```

### Create ELK operator

  ```
  helm install elastic-operator elastic/eck-operator -n elastic-system

  ```
### Verify the Installation

  ```
  kubectl get pods -n elastic-system

  ```
  #### You should see something similar to:

  ![](https://github.com/AliKhamed/ivolve_labs/blob/main/oc/lab11/screenshots/el1.png)

### Deploy an Elasticsearch Cluster

  ```
  kubectl create namespace elasticsearch

  kubectl apply -f - <<EOF
  apiVersion: elasticsearch.k8s.elastic.co/v1
  kind: Elasticsearch
  metadata:
    name: quickstart
    namespace: elasticsearch
  spec:
    version: 7.10.0
    nodeSets:
    - name: default
      count: 1
      config:
        node.store.allow_mmap: false
  EOF

  ```
### Verify Elasticsearch Deployment


  ```
    kubectl get pods -n elasticsearch

  ```
  #### You should see something similar to:

  ```
  quickstart-es-default-0  1/1     Running   0          5m

  ```


