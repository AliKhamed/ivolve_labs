## Lab8 Description 

Helm Chart Deployment Objective: Use Helm Chart to deploy and manage applications in an OpenShift cluster. Explore Helm charts for common services. Create a new Helm chart for Nginx. Deploy the Helm chart and verify the deployment. Access the Nginx server. Delete nginx release.

### Steps 
1. **Create a new Helm chart for Nginx.**
2. **Deploy the Helm chart and verify the deployment.**
3. **Access the Nginx server.**
4. **Delete nginx release.**


## Solution Steps

### Step1: Create a new Helm chart for Nginx.

  #### By Apply 

  ```
   helm create nginx-chart

  ```
  ![](https://github.com/AliKhamed/ivolve_labs/blob/main/oc/lab8/screenshots/lab8.1.png)


### Step2: Deploy the Helm chart and verify the deployment.

  #### Before deploy the chart you should change the value of service:type to NodePort in values.yaml file in the nginx-chart and apply the chart by run 
  
  ``` 
    helm install nginx-release nginx-chart

  ```
  ![](https://github.com/AliKhamed/ivolve_labs/blob/main/oc/lab8/screenshots/lab8.2.png)




### Step3: Access the Nginx server.

#### By run the following command

```
minikube service nginx-1-nginx-chart --url

```
  ![](https://github.com/AliKhamed/ivolve_labs/blob/main/oc/lab8/screenshots/lab8.3.png)
  ![](https://github.com/AliKhamed/ivolve_labs/blob/main/oc/lab8/screenshots/lab8.4.png)



### Step4: Delete nginx release.

```
  helm delete nginx-release 

```
  ![](https://github.com/AliKhamed/ivolve_labs/blob/main/oc/lab8/screenshots/lab8.5.png)


