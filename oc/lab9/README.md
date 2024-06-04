## Lab9 Description 

Daemonsets & Taint and Toleration . Objective: what is daemonset and what is it used for? Create a DaemonSet YAML filewith a Pod template containing an Nginx container in openshift and verify the number of pods. Using minikube, Taint the Minikube node with a specific key-value pair 'color=red' to simulate a tainted node. Create a pod with toleration 'color=blue' and notice what is the status of the pod, change the toleration to 'color=red' and notice what will happen. Make a Comparison between Taint & Toleration & Node Affinity.

### Steps 
1. **what is daemonset and what is it used for?**

2. **Create a DaemonSet YAML filewith a Pod template containing an Nginx container in openshift and verify the number of pods.**

3. **Using minikube, Taint the Minikube node with a specific key-value pair 'color=red' to simulate a tainted node.**

4. **Create a pod with toleration 'color=blue' and notice what is the status of the pod, change the toleration to 'color=red' and notice what will happen.**

5. **Make a Comparison between Taint & Toleration & Node Affinity.**


## Solution Steps

### Step1: what is daemonset and what is it used for?

  #### A DaemonSet is a type of workload in Kubernetes that ensures that a specific pod is running on each node in a cluster.
  #### DaemonSets are useful in scenarios where you need to perform tasks that are required on every node, such as log collection, monitoring agents, or networking services.
  


### Step2: Create a DaemonSet YAML filewith a Pod template containing an Nginx container in openshift and verify the number of pods.

#### DaemonSet.yml file content

```
apiVersion: apps/v1
kind: DaemonSet
metadata:
  name: nginx-daemonset
  labels:
    app: nginx
spec:
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
        image: nginx:latest
        ports:
        - containerPort: 80

```
  #### login to oc cluster
  ![](https://github.com/AliKhamed/ivolve_labs/blob/main/oc/lab9/screenshots/lab9.1.png)

  #### Apply And check
   ![](https://github.com/AliKhamed/ivolve_labs/blob/main/oc/lab9/screenshots/lab9.2.png)



### Step3: Using minikube, Taint the Minikube node with a specific key-value pair 'color=red' to simulate a tainted node.

#### Run 


```
kubectl taint nodes minikube color=red:NoSchedule

```
![](https://github.com/AliKhamed/ivolve_labs/blob/main/oc/lab9/screenshots/lab9.3.png)


### Step4: Create a pod with toleration 'color=blue' and notice what is the status of the pod, change the toleration to 'color=red' and notice what will happen.

#### Create a pod with toleration 'color=blue' 

```
apiVersion: v1
kind: Pod
metadata:
  name: pod-blue
spec:
  containers:
    - name: nginx
      image: nginx
  tolerations:
    - key: "color"
      operator: "Equal"
      value: "blue"
      effect: "NoSchedule"


```
#### what is the status of the pod after apply

  ![](https://github.com/AliKhamed/ivolve_labs/blob/main/oc/lab9/screenshots/lab9.4.png)
  ![](https://github.com/AliKhamed/ivolve_labs/blob/main/oc/lab9/screenshots/lab9.5.png)

#### change the toleration to 'color=red' and notice what will happen

```
apiVersion: v1
kind: Pod
metadata:
  name: pod-blue
spec:
  containers:
    - name: nginx
      image: nginx
  tolerations:
    - key: "color"
      operator: "Equal"
      value: "red"
      effect: "NoSchedule"

```
#### Apply
  ![](https://github.com/AliKhamed/ivolve_labs/blob/main/oc/lab9/screenshots/lab9.6.png)
  ![](https://github.com/AliKhamed/ivolve_labs/blob/main/oc/lab9/screenshots/lab9.7.png)


### Step5: Make a Comparison between Taint & Toleration & Node Affinity.



| Feature                  | Taints & Tolerations                              | Node Affinity                                        |
|--------------------------|---------------------------------------------------|------------------------------------------------------|
| **Primary Function**     | Exclude or evict pods based on node taints        | Prefer or require nodes based on labels              |
| **Application Scope**    | Node-based constraints                            | Pod-based scheduling preferences                     |
| **Scheduling Influence** | Directly prevents or evicts pods                  | Influences scheduling decisions based on node labels |
| **Implementation**       | Taints on nodes, Tolerations on pods              | `nodeSelector`, `affinity` fields in pod specs       |
| **Complexity**           | Moderate (requires setting both taints and tolerations) | Simple to advanced (depends on usage of `nodeSelector` or `affinity`) |
| **Flexibility**          | High control over pod exclusion and eviction      | Flexible node selection based on multiple conditions |
| **Use Cases**            | Maintenance, workload segregation, resource protection | Workload distribution, specific hardware requirements |






