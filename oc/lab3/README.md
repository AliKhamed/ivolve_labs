## Lab3 Description 

Storage Configuration Objective: Create a Kubernetes deployment named my-deployment with 1 replica using the NGINX image. Exec into the NGINX pod and create a file at /usr/share/nginx/html/hello.txt with the content hello, this is <your-name>, verify the file is served by NGINX using curl localhost/hello.txt. Delete the NGINX pod and wait for the deployment to create a new pod then exec into the new pod and verify the file at /usr/share/nginx/html/hello.txt is no longer present. Create a Persistent Volume Claim (PVC). Modify the deployment to attach the PVC to the pod at /usr/share/nginx/html. Repeat the previous steps and Verify the file persists across pod deletions. Make a Comparison between PV, PVC, and StorageClass.

### Steps 
1. **Create a Kubernetes deployment named my-deployment with 1 replica using the NGINX image**
2. **Exec into the NGINX pod and create a file at /usr/share/nginx/html/hello.txt with the content hello, this is <your-name>, verify the file is served by NGINX using curl localhost/hello.txt.**
3. **Delete the NGINX pod and wait for the deployment to create a new pod then exec into the new pod and verify the file at /usr/share/nginx/html/hello.txt is no longer present.**
4. **Create a Persistent Volume Claim (PVC). Modify the deployment to attach the PVC to the pod at /usr/share/nginx/html.**
5. **Repeat the previous steps and Verify the file persists across pod deletions.**
6. **Make a Comparison between PV, PVC, and StorageClass.**



## Solution Steps

### Step1: Create a Kubernetes deployment named my-deployment with 1 replica using the NGINX image

  #### create nginx.yaml file

  ```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-deployment
spec:
  replicas: 1
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx
        ports:
        - containerPort: 80
  ```
#### And apply nginx.yaml
```
  oc apply -f nginx.yaml

```
### Step2: Exec into the NGINX pod and create a file at /usr/share/nginx/html/hello.txt with the content hello, this is <your-name>, verify the file is served by NGINX using curl localhost/hello.txt.

#### Run 

  ![](https://github.com/AliKhamed/ivolve_labs/blob/main/oc/lab3/screenshots/lab3.1.png)



### Step3: Delete the NGINX pod and wait for the deployment to create a new pod then exec into the new pod and verify the file at /usr/share/nginx/html/hello.txt is no longer present.

#### Run

 ![](https://github.com/AliKhamed/ivolve_labs/blob/main/oc/lab3/screenshots/lab3.2.png)




### Step4: Create a Persistent Volume Claim (PVC). Modify the deployment to attach the PVC to the pod at /usr/share/nginx/html.

#### create pv.yaml, pvc.yaml and modify the nginx-deployment.yaml files
#### pv.yaml

```
  apiVersion: v1
kind: PersistentVolume
metadata:
  name: nginx-pv
spec:
  capacity:
    storage: 1Gi
  accessModes:
    - ReadWriteOnce
  hostPath:
    path: /data/nginx


```
#### pvc.yaml
```
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: nginx-pvc
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 1Gi

```
#### modify the nginx-deployment.yaml
```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-deployment
spec:
  replicas: 1
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx
        ports:
        - containerPort: 80
        volumeMounts:
        - name: nginx-storage
          mountPath: /usr/share/nginx/html
      volumes:
      - name: nginx-storage
        persistentVolumeClaim:
          claimName: nginx-pvc

```
#### Run 

 ![](https://github.com/AliKhamed/ivolve_labs/blob/main/oc/lab3/screenshots/lab3.3.png)


### Step5: Repeat the previous steps and Verify the file persists across pod deletions.

#### Run 

![](https://github.com/AliKhamed/ivolve_labs/blob/main/oc/lab3/screenshots/lab3.4.png)

### Step6: Make a Comparison between PV, PVC, and StorageClass.
#### Comparison between PersistentVolume (PV), PersistentVolumeClaim (PVC), and StorageClass

| Feature                    | PersistentVolume (PV)                                    | PersistentVolumeClaim (PVC)                             | StorageClass                                           |
|----------------------------|----------------------------------------------------------|--------------------------------------------------------|-------------------------------------------------------|
| **Purpose**                | Represents a piece of storage in the cluster             | A request for storage by a user                         | Defines classes of storage to dynamically provision PVs |
| **Managed By**             | Cluster administrator                                    | Application developers/users                            | Cluster administrator                                  |
| **Lifecycle**              | Independent of any specific pod                          | Binds to a PV based on request                          | Used to create PVs dynamically                        |
| **Binding**                | Static binding to a PVC                                  | Requests a PV with specific characteristics             | Can define parameters for dynamic PV provisioning     |
| **Access Modes**           | Defines how the PV can be accessed (RWO, ROX, RWX)       | Requests specific access modes                          | Not directly associated with access modes             |
| **Capacity**               | Specifies the storage capacity                           | Requests a specific amount of storage                   | Defines storage classes but not specific capacities   |
| **Reclaim Policy**         | Determines what happens to the PV when released (Retain, Recycle, Delete) | N/A                                                    | N/A                                                   |
| **Dynamic Provisioning**   | Not applicable                                           | Not applicable                                          | Supports dynamic provisioning of PVs                  |
| **Use Case**               | Provides actual storage resources                        | Requests and consumes storage resources                 | Abstracts and automates storage provisioning          |
| **Example Use**            | NFS, iSCSI, cloud storage volumes                        | Application requesting storage for a database           | SSD vs HDD storage classes, different performance tiers|
| **Creation**               | Manually created by admin                                | Created by developers in their application manifests    | Defined by admin for different storage requirements   |

  

