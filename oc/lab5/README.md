## Lab5 Description 

OpenShift Security and RBAC Objective: Create a ServiceAccount in the namespace. Define a Role named pod-reader allowing read-only access to pods in the namespace. Bind the pod-reader Role to the ServiceAccount. Get ServiceAccount token. Make a Comparison between role & role binding and cluster role & cluster role binding.

### Steps 
1. **Create a ServiceAccount**
2. **Define a Role named pod-reader allowing read-only access to pods in the namespace**
3. **Bind the pod-reader Role to the ServiceAccount**
4. **Get ServiceAccount token**
5. **Make a Comparison between role & role binding and cluster role & cluster role binding.**


## Solution Steps

### Step1: Create a ServiceAccount

  #### Create ServiceAccount.yml file

  ```
   apiVersion: v1
   kind: ServiceAccount
   metadata:
     name: pod-reader-sa
     namespace: alikhames

  ```


### Step2: Define a Role named pod-reader allowing read-only access to pods in the alikhames namespace

#### Create role.yml file

```
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: pod-reader
  namespace: alikhames
rules:
- apiGroups: [""]
  resources: ["pods"]
  verbs: ["get", "list", "watch"]


```


### Step3: Bind the pod-reader Role to the ServiceAccount

#### Create role-binding.yml file to bind role to ServiceAccount

```
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: pod-reader-binding
  namespace: alikhames
subjects:
- kind: ServiceAccount
  name: pod-reader-sa
roleRef:
  kind: Role
  name: pod-reader
  apiGroup: rbac.authorization.k8s.io


```



### Step4: Get ServiceAccount token
#### Run

```
oc get serviceaccount pod-reader-sa -n alikhames -o jsonpath='{.secrets[0].name}' ; echo

or 

oc describe serviceaccounts pod-reader-sa 

Name:                pod-reader-sa
Namespace:           alikhames
Labels:              <none>
Annotations:         <none>
Image pull secrets:  pod-reader-sa-dockercfg-r7n76
Mountable secrets:   pod-reader-sa-token-tzn2c
                     pod-reader-sa-dockercfg-r7n76
Tokens:              pod-reader-sa-token-9z4zl
                     pod-reader-sa-token-tzn2c


```


### Step5: Make a Comparison between role & role binding and cluster role & cluster role binding.


| Feature                | Role                              | RoleBinding                                | ClusterRole                          | ClusterRoleBinding                      |
|------------------------|-----------------------------------|--------------------------------------------|--------------------------------------|-----------------------------------------|
| **Scope**              | Namespace-specific                | Namespace-specific                         | Cluster-wide                         | Cluster-wide or Namespace-specific      |
| **Usage**              | Defines permissions within a namespace | Assigns a Role to a user/group/ServiceAccount within a namespace | Defines cluster-wide permissions or namespace-specific permissions | Assigns a ClusterRole to a user/group/ServiceAccount across the cluster or within a specific namespace |
| **Resource Definition**| Yes                               | Yes                                        | Yes                                  | Yes                                     |
| **Resource Kind**      | `Role`                            | `RoleBinding`                              | `ClusterRole`                        | `ClusterRoleBinding`                   |
| **API Group**          | `rbac.authorization.k8s.io`       | `rbac.authorization.k8s.io`               | `rbac.authorization.k8s.io`         | `rbac.authorization.k8s.io`            |
| **Scope Flexibility**  | Limited to a single namespace     | Limited to binding Roles within a namespace | Can be applied cluster-wide or to specific namespaces | Can bind ClusterRoles across the cluster or within specific namespaces |
| **Example Use Case**   | Read-only access to pods in a specific namespace | Bind read-only Role to a ServiceAccount in a specific namespace | Read-only access to all pods across the cluster | Bind read-only ClusterRole to a ServiceAccount for all namespaces or specific namespace |
| **YAML Definition**    | ```yaml<br>kind: Role<br>metadata:<br>  namespace: default<br>  name: pod-reader<br>rules:<br>- apiGroups: [""]<br>  resources: ["pods"]<br>  verbs: ["get", "list", "watch"]``` | ```yaml<br>kind: RoleBinding<br>metadata:<br>  name: read-pods-binding<br>  namespace: default<br>subjects:<br>- kind: ServiceAccount<br>  name: pod-reader-sa<br>  namespace: default<br>roleRef:<br>  kind: Role<br>  name: pod-reader<br>  apiGroup: rbac.authorization.k8s.io``` | ```yaml<br>kind: ClusterRole<br>metadata:<br>  name: cluster-pod-reader<br>rules:<br>- apiGroups: [""]<br>  resources: ["pods"]<br>  verbs: ["get", "list", "watch"]``` | ```yaml<br>kind: ClusterRoleBinding<br>metadata:<br>  name: read-pods-cluster-binding<br>subjects:<br>- kind: ServiceAccount<br>  name: pod-reader-sa<br>  namespace: default<br>roleRef:<br>  kind: ClusterRole<br>  name: cluster-pod-reader<br>  apiGroup: rbac.authorization.k8s.io``` |

