## Lab1 Description 

 Terraform Modules Objective: Modularize Terraform configurations using modules. Create reusable components for common infrastructure patterns and deploy them in different environments.

### Steps 
1. **Create terraform.tf files and variables for vpc, ec2, rds resources using modules style**
2. **Intializ terraform**
3. **Plan and Apply**
4. **Check the resources that you apply in AWS console**
5. **Destroy terraform**


## Solution Steps

### Step1: Create terraform.tf files and variables for vpc, ec2, rds resources using modules

  #### create the following files

  ![](https://github.com/AliKhamed/ivolve_labs/blob/main/terraform/lab2/screenshots/tree.png)
 

### Step2: Intialize terraform

#### Run 
  ```
  terraform init

  ```
### Step3: Plan and Apply
#### First run terraform plan to show the resources that will applyed

![](https://github.com/AliKhamed/ivolve_labs/blob/main/terraform/lab2/screenshots/plan.png)

#### run terraform apply by 

  ```
    terraform apply 

  ```

### Step4: Check the resources that you apply in AWS console
#### Enter on your aws account and check the resources
#### VPC
  ![](https://github.com/AliKhamed/ivolve_labs/blob/main/terraform/lab2/screenshots/vpc.png)

#### Public EC2
  ![](https://github.com/AliKhamed/ivolve_labs/blob/main/terraform/lab2/screenshots/ec2.png)

#### RDS
  ![](https://github.com/AliKhamed/ivolve_labs/blob/main/terraform/lab2/screenshots/rds.png)

### Step5: Destroy terraform
#### You must destroy because the cost ():

  ![](https://github.com/AliKhamed/ivolve_labs/blob/main/terraform/lab1/screenshots/destroy.png)
  
### Well Done!
  

