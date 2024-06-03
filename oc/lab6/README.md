## Lab6 Description 

Create a namespace called nti and Apply resource quota to limit resource usage within the namespace. Create a Deployment in this namespace for the MySQL pod that uses the ConfigMap and Secret. Define MySQL database name and user in a ConfigMap. Store the MySQL root password and user password in a Secret, Resources Requests: CPU: 0.5 vcpu Mem: 1G, Resources Limits: CPU: 1 vcpu Mem: 2G. Exec into the MySQL pod and verify the MySQL configuration.

### Steps 
1. **Create a namespace called nti and Apply resource quota to limit resource usage within the namespace.**
2. **Create ConfigMap and Secret.**
3. **Create a Deployment in this namespace for the MySQL pod that uses the ConfigMap and Secret.**
4. **Apply**
5. **Exec into the MySQL pod and verify the MySQL configuration.**


## Solution Steps

### Step1: Create a namespace called nti and Apply resource quota to limit resource usage within the namespace.

  #### Create namespace 
  ```
    Kubectl create ns nti

  ```

#### Apply resource quota to limit resource usage within the namespace

  ```
  apiVersion: v1
  kind: ResourceQuota
  metadata:
    name: pod-limit
    namespace: nti
  spec:
    hard:
      pods: "5"


  ```

### Step2: Create ConfigMap and Secret

#### Create ConfigMap.yml file

```
apiVersion: v1
kind: ConfigMap
metadata:
  name: mysql-config
  namespace: nti
data:
  MYSQL_DATABASE: mydb
  MYSQL_USER: ali

```
#### Create db-secret.yaml using dry-run
```
kubectl create secret generic db_secret --from-literal MYSQL_ROOT_PASSWORD=root --from-literal MYSQL_PASSWORD=pass --dry-run=client -o yaml > db-secrets.yml

```

### Step3: Create a Deployment in this namespace for the MySQL pod that uses the ConfigMap and Secret.
#### Create MySQL Deployment As

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: mysql-deployment
  namespace: nti
spec:
  replicas: 1
  selector:
    matchLabels:
      app: mysql
  template:
    metadata:
      labels:
        app: mysql
    spec:
      containers:
      - name: mysql
        image: mysql:latest
        env:
        - name: MYSQL_ROOT_PASSWORD
          valueFrom:
            secretKeyRef:
              name: db-secrets
              key: MYSQL_ROOT_PASSWORD
        - name: MYSQL_PASSWORD
          valueFrom:
            secretKeyRef:
              name: db-secrets
              key: MYSQL_PASSWORD
        - name: MYSQL_DATABASE
          valueFrom:
            configMapKeyRef:
              name: mysql-config
              key: MYSQL_DATABASE
        - name: MYSQL_USER
          valueFrom:
            configMapKeyRef:
              name: mysql-config
              key: MYSQL_USER
        ports:
        - containerPort: 3306
        resources:
          requests:
            cpu: "0.5"
            memory: "1Gi"
          limits:
            cpu: "1"
            memory: "2Gi"

```



### Step4: Apply yml files As following:
#### Run kubectl apply -f fileName.yml

```
kubectl apply -f resource-quota.yml
kubectl apply -f configMap.yml
kubectl apply -f db-secrets.yml
kubectl apply -f mysql-deployment.yml

```


### Step5: Exec into the MySQL pod and verify the MySQL configuration

#### Run 

![](https://github.com/AliKhamed/ivolve_labs/blob/main/oc/lab6/screenshots/lab6.1.png)
![](https://github.com/AliKhamed/ivolve_labs/blob/main/oc/lab6/screenshots/lab6.2.png)

