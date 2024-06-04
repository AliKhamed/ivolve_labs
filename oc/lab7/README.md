## Lab7 Description 

Multi-container Applications Objective: Create a deployment for Jenkins with an init container that sleeps for 10 seconds before the Jenkins container starts. Use readiness and liveness probes to monitor Jenkins. Create a NodePort service to expose Jenkins. Verify that the init container runs successfully and Jenkins is properly initialized. What is the differnet between readiness & liveness, init & sidecar container.

### Steps 
1. **Create jenkins deployment yaml file.**
2. **Create a NodePort service to expose Jenkins.**
3. **Verify that the init container runs successfully and Jenkins is properly initialized.**
4. **What is the differnet between readiness & liveness, init & sidecar container.**


## Solution Steps

### Step1: Create jenkins deployment yaml file.

  #### Contents
  ```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: jenkins-deployment
spec:
  replicas: 1
  selector:
    matchLabels:
      app: jenkins-deployment
  template:
    metadata:
      labels:
        app: jenkins-deployment
    spec:
      containers:
        - name: jenkins-deployment
          image: jenkins/jenkins
          ports:
            - containerPort: 8080
              name: http
          readinessProbe:
            httpGet:
              path: /login
              port: 8080
            initialDelaySeconds: 30
            periodSeconds: 5
          livenessProbe:
            httpGet:
              path: /login
              port: 8080
            initialDelaySeconds: 60
            periodSeconds: 5
      initContainers:
        - name: init
          image: busybox
          command: ['sh', '-c', 'sleep 10']

  ```


### Step2: Create a NodePort service to expose Jenkins.

  #### Contents
  ``` 
apiVersion: v1
kind: Service
metadata:
  name: jenkins-service
spec:
  type: NodePort
  selector:
    app: jenkins-deployment
  ports:
    - protocol: TCP
      port: 8080
      targetPort: 8080
      nodePort: 30008
  ```


### Step3: Verify that the init container runs successfully and Jenkins is properly initialized.


  ![](https://github.com/AliKhamed/ivolve_labs/blob/main/oc/lab7/screenshots/lab7.1.png)
  ![](https://github.com/AliKhamed/ivolve_labs/blob/main/oc/lab7/screenshots/lab7.2.png)

  ![](https://github.com/AliKhamed/ivolve_labs/blob/main/oc/lab7/screenshots/lab7.3.png)
  ![](https://github.com/AliKhamed/ivolve_labs/blob/main/oc/lab7/screenshots/lab7.4.png)



### Step4: What is the differnet between readiness & liveness, init & sidecar container.

#### Kubernetes Probes: Readiness vs. Liveness


| Aspect                  | Readiness Probe                              | Liveness Probe                                       |
|-------------------------|----------------------------------------------|------------------------------------------------------|
| **Primary Purpose**     | Determine if a pod is ready to accept traffic | Determine if a pod is healthy and running            |
| **Function**            | Indicates when a pod is ready to start serving requests | Indicates if a pod needs to be restarted             |
| **Impact on Pod State** | Controls pod inclusion in service load balancer | Controls pod restart policy                          |
| **Typical Use Cases**   | - Ensuring pod dependencies are met before traffic is sent<br>- Delaying traffic until the pod is ready | - Detecting and recovering from pod crashes or hangs<br>- Ensuring long-running pods stay healthy |
| **Configuration**       | Defined in the pod spec under `readinessProbe` | Defined in the pod spec under `livenessProbe`        |
| **When it Runs**        | Continuously after the initial delay, checking pod readiness | Continuously after the initial delay, checking pod health |
| **Failure Consequence** | Pod is marked as not ready, removed from service endpoints | Pod is restarted by the kubelet                       |
| **Common Checks**      | - HTTP checks<br>- TCP checks<br>- Exec command checks | - HTTP checks<br>- TCP checks<br>- Exec command checks |



#### Init Container vs Sidecar Container

| Feature              | Init Container                                                                 | Sidecar Container                                                        |
|----------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------|
| **Purpose**          | Runs before main application containers to perform initialization tasks        | Runs alongside main application containers to provide auxiliary services |
| **Lifecycle**        | Runs to completion before the main containers start                            | Runs concurrently with the main containers throughout the Pod's lifecycle|
| **Order of Execution**| Executes sequentially before any app container starts                         | Executes concurrently with app containers                                |
| **Use Cases**        | Setup scripts, configuration, data initialization                              | Logging, monitoring, proxying, data synchronization                      |
| **Resource Sharing** | Shares CPU, memory, and network resources with main containers but not concurrently | Shares CPU, memory, network, and volumes with main containers            |
| **Support for Probes**| Does not support liveness, readiness, or startup probes                       | Supports liveness, readiness, and startup probes                         |
| **Configuration**    | Specified under `initContainers` field in the Pod specification                | Specified under `containers` field in the Pod specification              |
| **Failure Handling** | Kubelet restarts init container until it succeeds if it fails                  | Follows the Pod's restart policy if it fails                             |








