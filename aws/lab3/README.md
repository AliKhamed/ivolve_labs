## Lab3 Description 

 Create AWS Load Balancer Objective: create VPC with 2 subnets, launch 2 EC2s with nginx and apache installed, and create and configure a Load Balancer to access the Web server.

### Steps 
1. **Create VPC with 2 subnets**
2. **Launch 2 EC2s with nginx and apache installed**
3. **Create and configure a Load Balancer to access the Web server**



## Solution Steps

### Step1: Create VPC with 2 subnets

  Create vpc with two public subnets in different AZs

  ![](https://github.com/AliKhamed/ivolve_labs/blob/main/aws/lab3/screenshots/vpc.png)
 

### Step2: Launch 2 EC2s with nginx and apache installed

 Create nginx ec2 by the following configuration

  ![](https://github.com/AliKhamed/ivolve_labs/blob/main/aws/lab3/screenshots/nginx1.png)
  Add HTTP inbound rule to open port 80 for nginx web page
   ![](https://github.com/AliKhamed/ivolve_labs/blob/main/aws/lab3/screenshots/nginx2.png)
   And add nginx installation commands in user data because run nginx 
    ![](https://github.com/AliKhamed/ivolve_labs/blob/main/aws/lab3/screenshots/nginx3.png)

  And the same configuration to apache but edit user data as following

   ![](https://github.com/AliKhamed/ivolve_labs/blob/main/aws/lab3/screenshots/apache1.png)

  Two EC2 running

   ![](https://github.com/AliKhamed/ivolve_labs/blob/main/aws/lab3/screenshots/ec2s.png)

### Step3: Create and configure a Load Balancer to access the Web server

Create Application Load Balancer
  
  ![](https://github.com/AliKhamed/ivolve_labs/blob/main/aws/lab3/screenshots/alb1.1.png)

With the following configuration:

  ![](https://github.com/AliKhamed/ivolve_labs/blob/main/aws/lab3/screenshots/alb2.png)

  ![](https://github.com/AliKhamed/ivolve_labs/blob/main/aws/lab3/screenshots/alb3.png)

  And you should create target group and add the 2 EC2 to listner:

   ![](https://github.com/AliKhamed/ivolve_labs/blob/main/aws/lab3/screenshots/alb4.png)
   
   ![](https://github.com/AliKhamed/ivolve_labs/blob/main/aws/lab3/screenshots/tg1.png)

   And copy ALB dns and check the traffic in new tabe

   ![](https://github.com/AliKhamed/ivolve_labs/blob/main/aws/lab3/screenshots/dns.png)

   ![](https://github.com/AliKhamed/ivolve_labs/blob/main/aws/lab3/screenshots/dns2.png)

   ![](https://github.com/AliKhamed/ivolve_labs/blob/main/aws/lab3/screenshots/dns3.png)

  
