## Lab4 Description 

 Multi-Tier Application Deployment with Terraform Objective: Use Terraform to define and deploy a multi-tier architecture, including VPC, subnets, EC2 instances, and an RDS database. Explore Terraform state management.

### Steps 
1. **Create terraform.tf files and variables for vpc, ec2, rds resources**
2. **Intializ terraform**
3. **Plan and Apply**
4. **Check the resources that you apply in AWS console**
5. **Destroy terraform**


## Solution Steps

### Step1: Create terraform.tf files and variables for vpc, ec2, rds resources

  #### create the following files

  ![](https://github.com/AliKhamed/ivolve_labs/blob/main/terraform/lab1/screenshots/tree.png)
 

### Step2: Intialize terraform

#### Run 
  ```
  terraform init

  ```
### Step3: Plan and Apply
#### First run terraform plan to show the resources that will applyed

![](https://github.com/AliKhamed/ivolve_labs/blob/main/terraform/lab1/screenshots/t-apply2.png)

#### run terraform apply by 

![](https://github.com/AliKhamed/ivolve_labs/blob/main/terraform/lab1/screenshots/t-apply.png)

### Step4: Check the resources that you apply in AWS console
#### Enter on your aws account and check the resources
#### VPC
  ![](https://github.com/AliKhamed/ivolve_labs/blob/main/terraform/lab1/screenshots/vpc.png)

#### Public EC2
  ![](https://github.com/AliKhamed/ivolve_labs/blob/main/terraform/lab1/screenshots/public-ec2.png)

#### RDS
  ![](https://github.com/AliKhamed/ivolve_labs/blob/main/terraform/lab1/screenshots/rds.png)

### Step5: Destroy terraform
#### You must destroy because the cost ():
 
### Well Done!
  

