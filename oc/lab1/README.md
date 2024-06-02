## Lab1 Description 

 Applications and Rolling Back Changes Objective: Deploy NGINX with 3 replicas. Create a service to expose NGINX deployment. Use port forwarding to access NGINX service locally. Update NGINX image to Apache. View deployment's rollout history. Roll back NGINX deployment to the previous image version and Monitor pod status to confirm successful rollback.

### Steps 
1. **Create nginx deployment and service**
2. **Use port-forward to access nginx service locally**
3. **Update NGINX image to Apache**
4. **View deployment's rollout history**
5. **Roll back NGINX deployment to the previous image version and Monitor pod status to confirm successful rollback**



## Solution Steps

### Step1: Create nginx deployment and service

  #### create nginx.yaml file

  ```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
spec:
  selector:
    matchLabels:
      app: nginx
  replicas: 3 
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: httpd
        ports:
        - containerPort: 80

---
apiVersion: v1
kind: Service
metadata:
  creationTimestamp: null
  name: nginx-service
spec:
  ports:
  - port: 80
    protocol: TCP
    targetPort: 80
  selector:
    app: nginx
  type: NodePort

  ```
#### And apply nginx.yaml
```
  oc apply -f nginx.yaml

```
### Step2: Use port-forward to access nginx service locally

#### Run 

  ![](https://github.com/AliKhamed/ivolve_labs/blob/main/oc/lab1/screenshots/portforward.png)
#### Run on your local browser
```
http://localhost:8080

```
  ![](https://github.com/AliKhamed/ivolve_labs/blob/main/oc/lab1/screenshots/nginx.png)
 


### Step3: Update NGINX image to Apache
#### You have two way to update image 
#### 1. from yaml file modify image value
#### 2. from command line

```
  oc set image deployment/nginx-deployment nginx=httpd:latest
  
```


### Step4: View deployment's rollout history

#### by apply
```
  oc rollout history deployment/nginx-deployment

```
 ![](https://github.com/AliKhamed/ivolve_labs/blob/main/oc/lab1/screenshots/roll_hist2.png)


### Step5: Roll back NGINX deployment to the previous image version and Monitor pod status to confirm successful rollback
#### Roll back
  ![](https://github.com/AliKhamed/ivolve_labs/blob/main/oc/lab1/screenshots/roll_back.png)

#### Monitor pod status

![](https://github.com/AliKhamed/ivolve_labs/blob/main/oc/lab1/screenshots/monitor_pod2.png)

#### Check image

![](https://github.com/AliKhamed/ivolve_labs/blob/main/oc/lab1/screenshots/imageStatus.png)


  

