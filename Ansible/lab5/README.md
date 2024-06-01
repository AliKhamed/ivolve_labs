## Lab5 Description 

 Ansible Roles for Application Deployment Objective: Organize Ansible playbooks using roles. Create an Ansible role for installing Jenkins, docker, openshift CLI 'OC'.

### Steps 
1. **Create the folder structure As following**
2. **Configure AWS AccessKey**
3. **Run Playbook**
4. **Check the Configuration that you apply in the EC2**



## Solution Steps

### Step1: Create the folder structure As following

  #### create the following files

  ![](https://github.com/AliKhamed/ivolve_labs/blob/main/terraform/lab4/screenshots/tree.png)
 
### Step2: Configure AWS AccessKey

#### Run 
  ```
  aws configure

  ```
#### Enter AccessKey ID and SecretAccessKey

### Step3: Run Playbook
#### First run 
```
  ansible-playbook -i inventory_file playbook.yaml file
```

![](https://github.com/AliKhamed/ivolve_labs/blob/main/terraform/lab4/screenshots/apply1.png)
![](https://github.com/AliKhamed/ivolve_labs/blob/main/terraform/lab4/screenshots/apply2.png)



### Step4: Check the Configuration that you apply in the EC2
#### Enter on your EC2 instance by ssh command and check 
#### docker ps
  ![](https://github.com/AliKhamed/ivolve_labs/blob/main/terraform/lab4/screenshots/docker.png)

#### jenkins status
![](https://github.com/AliKhamed/ivolve_labs/blob/main/terraform/lab4/screenshots/jenkins2.png)
![](https://github.com/AliKhamed/ivolve_labs/blob/main/terraform/lab4/screenshots/jenkins.png)

#### OC cli
  ![](https://github.com/AliKhamed/ivolve_labs/blob/main/terraform/lab4/screenshots/oc.png)

  

