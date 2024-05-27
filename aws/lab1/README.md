## Lab1 Description 

AWS Security Objective: Create AWS account, set billing alarm, create 2 IAM groups (admin-developer), admin group has admin permissions, developer group only access to s3, create admin-1 user console access only with MFA & admin-2-prog user with cli access only and list all users and groups using commands, create dev-user with programmatic and console access (take screenshots access EC2, S3)

### Steps 
1. **set billing alarm**
2. **create 2 IAM groups (admin-developer)**
3. **create admin-1 user console access only with MFA**
4. **create admin-2-prog user with cli access only and list all users and groups using commands**
5. **create dev-user with programmatic and console access**

## Solution Steps
### Step1: Create Budgets
![](https://github.com/AliKhamed/ivolve_labs/blob/main/aws/lab1/screenshots/billcost.png)

### Step2: Create 2 IAM groups (admin-developer)
![](https://github.com/AliKhamed/ivolve_labs/blob/main/aws/lab1/screenshots/lab1.1.png)

   And assign AdminFullAccess to admin group

![](https://github.com/AliKhamed/ivolve_labs/blob/main/aws/lab1/screenshots/lab1.3.png)

  And assign S3FullAccess to developer group

![](https://github.com/AliKhamed/ivolve_labs/blob/main/aws/lab1/screenshots/lab1.4.png)

### Step3: Create admin1 user console access only with MFA
  Create admin1 and admin2 user and add it to admin group

![](https://github.com/AliKhamed/ivolve_labs/blob/main/aws/lab1/screenshots/lab1.2.png)

  And assign console access with MFA to admin1 user

### Step4: Create admin-2-prog user with cli access only and list all users and groups using commands
  ![](https://github.com/AliKhamed/ivolve_labs/blob/main/aws/lab1/screenshots/users.png)
  
  And Access by AWS CLI using admin2 access key
  ![](https://github.com/AliKhamed/ivolve_labs/blob/main/aws/lab1/screenshots/admin1.png)
  And list all iam users by cli
  ![](https://github.com/AliKhamed/ivolve_labs/blob/main/aws/lab1/screenshots/admin1.1.png)

### Step5: Create dev-user with programmatic and console access

  First create dev user with console access and create access key in security credentials
  And create S3 buket to test it
  ![](https://github.com/AliKhamed/ivolve_labs/blob/main/aws/lab1/screenshots/dev1.1.png)

  Second try to access cli using dev user access key credentials
  And list S3 bukets and try to list iam users 
  ![](https://github.com/AliKhamed/ivolve_labs/blob/main/aws/lab1/screenshots/dev2.png)

