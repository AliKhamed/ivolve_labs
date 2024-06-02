## Lab2 Description 

Deployment vs. StatefulSet Objective: Make a Comparison between Deployment and StatefulSet. Create a YAML file for a MySQL Statefulset configuration. Write a YAML file to define a service for the MySQL StatefulSet.

### Steps 
1. **Create Comparison between Deployment and StatefulSet**
2. **Create a YAML file for a MySQL Statefulset configuration and a service for the MySQL StatefulSet**




## Solution Steps

### Step1: Create Comparison between Deployment and StatefulSet


| Feature                      | Deployment                                            | StatefulSet                                            |
|------------------------------|-------------------------------------------------------|-------------------------------------------------------|
| **Purpose**                  | Manages stateless applications                       | Manages stateful applications                          |
| **Pod Identity**             | Pods are interchangeable, no unique identity         | Each pod has a unique, stable identity                 |
| **Scaling**                  | Easily scalable by adjusting the number of replicas  | Scalable but each pod maintains its identity           |
| **Update Strategy**          | Supports rolling updates and rollbacks               | Supports rolling updates with ordered operations       |
| **Persistent Storage**       | Typically uses ephemeral storage                     | Designed to work with persistent storage               |
| **Pod Management**           | No guarantee on the order of pod creation or deletion| Ensures ordered, graceful deployment and scaling       |
| **Network Identity**         | Pods get random hostnames                            | Pods get stable network identities (e.g., predictable hostnames)|
| **Use Cases**                | Web servers, microservices, batch jobs               | Databases, distributed systems, clustered applications |
| **Volume Claims**            | Shared volumes, typically ephemeral                  | Each pod can have its own persistent volume            |
| **Configuration**            | Simpler to configure for stateless apps              | More complex configuration to ensure state consistency |
| **Health Checks**            | Can be defined, but stateless by nature              | Ensures individual pod health and state management     |
| **Data Storage**             | Data is lost when pod is deleted or replaced         | Data persists due to persistent volume claims          |
| **Service Integration**      | Works well with stateless services                   | Requires Headless Services for stable network identity |



### Step2: Create a YAML file for a MySQL Statefulset configuration and a service for the MySQL StatefulSet

#### MySQL Statefulset YAML file content
```

apiVersion: apps/v1
kind: StatefulSet
metadata:
  name: mysql
spec:
  selector:
    matchLabels:
      app: mysql
  serviceName: "mysql"
  replicas: 3
  template:
    metadata:
      labels:
        app: mysql
    spec:
      containers:
      - name: mysql
        image: mysql:latest
        ports:
        - containerPort: 3306
          name: mysql
        env:
        - name: MYSQL_ROOT_PASSWORD
          value: "rootpassword"
        volumeMounts:
        - name: mysql-persistent-storage
          mountPath: /var/lib/mysql
  volumeClaimTemplates:
  - metadata:
      name: mysql-persistent-storage
    spec:
      accessModes: [ "ReadWriteOnce" ]
      resources:
        requests:
          storage: 500M

``` 
#### Service file content
```
apiVersion: v1
kind: Service
metadata:
  name: mysql
  labels:
    app: mysql
spec:
  ports:
  - port: 3306
    name: mysql
  clusterIP: None
  selector:
    app: mysql

```



  

