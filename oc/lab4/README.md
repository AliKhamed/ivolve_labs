## Lab4 Description 

Network Configuration Objective: Build image from Dockerfile https://github.com/IbrahimmAdel/static-website.git and push it to your DockerHub. Create a deployment using this custom NGINX image. Create a service to expose the deployment. Define a network policy that allow traffic to the NGINX pods only from other pods within the same namespace. Enable the NGINX Ingress controller using Minikube addons. Create an Ingress resource. Update /etc/hosts to map the domain to the Minikube IP address. Access the custom NGINX service via the Ingress endpoint using the domain name, create a route in openshift.

### Steps 
1. **Build image from Dockerfile and push it to your DockerHub**
2. **Create a deployment using this custom NGINX image and service to expose the deployment**
3. **Define a network policy that allow traffic to the NGINX pods only from other pods within the same namespace.**
4. **Enable the NGINX Ingress controller using Minikube addons.**
5. **Create an Ingress resource. Update /etc/hosts to map the domain to the Minikube IP address.**
6. **Access the custom NGINX service via the Ingress endpoint using the domain name**
7. **create a route in openshift.**



## Solution Steps

### Step1: Build image from Dockerfile and push it to your DockerHub

  #### 1. git clone to the repo

  ```
    git clone https://github.com/IbrahimmAdel/static-website.git

  ```
  #### 2. build image from Dockerfile

  ```
    docker build -t myapp:v1.0 .

  ```
  ![](https://github.com/AliKhamed/ivolve_labs/blob/main/oc/lab4/screenshots/lab4.3.png)

  #### 3. Add tage to new image
  ```
  docker tag myapp:v1.0 alikhames/myapp:v1.0

  ```
  #### 4. login to docker hub and push image

  ![](https://github.com/AliKhamed/ivolve_labs/blob/main/oc/lab4/screenshots/lab4.4.png)


### Step2: Create a deployment using this custom NGINX image and service to expose the deployment

#### create nginx-deployment.yml

 ```
 apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
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
        image: alikhames/myapp:v1.0
        ports:
        - containerPort: 80

 ```

 #### Create nginx-service.yml
 ```
apiVersion: v1
kind: Service
metadata:
  name: nginx-service
spec:
  selector:
    app: nginx
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
  type: ClusterIP

 ```



### Step3: Define a network policy that allow traffic to the NGINX pods only from other pods within the same namespace.

#### Create nginx-network-policy.yml
```
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: nginx-allow-same-namespace
spec:
  podSelector:
    matchLabels:
      app: nginx
  ingress:
  - from:
    - podSelector: {}

```


### Step4: Enable the NGINX Ingress controller using Minikube addons.
#### By Run
```
minikube addons enable ingress

```


### Step5: Create an Ingress resource. Update /etc/hosts to map the domain to the Minikube IP address.

#### create nginx-ingress.yml
```
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: nginx-ingress
  annotations:
    nginx.ingress.kubernetes.io/rewrite-target: /
spec:
  rules:
  - host: nginx.local
    http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: nginx-service
            port:
              number: 80

```
#### Run As following 

![](https://github.com/AliKhamed/ivolve_labs/blob/main/oc/lab4/screenshots/lab4.5.png)

### Step6: Access the custom NGINX service via the Ingress endpoint using the domain name

#### Enter on your browser 

![](https://github.com/AliKhamed/ivolve_labs/blob/main/oc/lab4/screenshots/lab4.1.png)


### Step7: Create a route in openshift

#### create nginx-route.yml
```
apiVersion: route.openshift.io/v1
kind: Route
metadata:
  name: nginx-route
spec:
  to:
    kind: Service
    name: nginx-service
  port:
    targetPort: 80
  tls:
    termination: edge
  wildcardPolicy: None

```
