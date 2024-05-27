## Lab2 Description 

Launching an EC2 Instance Objective: create private subnet and launch EC2, configure security groups, connect to the instance using bastion host

### Steps 
1. **Create VPC With two subnets public and private**
2. **Create Bastion EC2 in public subnet**
3. **Create private EC2 in private subnet**
4. **Connect to bastion host by ssh and inside bastion connect to private ec2**


## Solution Steps

### Step1: Create VPC With two subnets public and private

  ![](aws/lab2/screenshots/vpc.png)
 

### Step2: Create Bastion EC2 in public subnet

  ![](aws/lab2/screenshots/bas-ec2.png)

  And assign it in new vpc that created in step 1
  And create new security group and allow ssh inbound rule 

  ![](aws/lab2/screenshots/bs-sg.png)

### Step3: Create Private EC2 in private subnet

  ![](aws/lab2/screenshots/pr1.png)
  ![](aws/lab2/screenshots/pri-ec2.png)

  And create new security group and allow inbound rule and Source type custom from public security group of bastion destnation

  ![](aws/lab2/screenshots/pr2.png)


### Step4: Connect to bastion host by ssh and inside bastion connect to private ec2

  First download privatekey.pem and change permission by 
  ```
    chmod 400 privatekey.pem

  ```
And connect to bastion host by 
  ``` 
    ssh -i privatekey.pem hostname@ec2-public-ip

  ```

  ![](aws/lab2/screenshots/ssh1.png)

  And copy privatekey.pem from local host to bastion host by
  ```
    scp  privatekey.pem ubuntu@ec2-private-ip:/home/

  ```
  And connect to private host 

  ![](aws/lab2/screenshots/ssh2.png)




