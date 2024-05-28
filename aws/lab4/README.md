## Lab4 Description 

  SDK and CLI Interactions Objective: Use the AWS CLI to Create an S3 bucket, configure permissions, and upload/download files to/from the bucket. Enable versioning and logging for the bucket.

### Steps 
1. **Configure aws access key in your terminal**
2. **Create s3 bucket**
3. **Enable versioning**
4. **Create another bucket for logging and set their policy**
5. **Upload and download file to your bucket**


## Solution Steps

### Step1: Configure aws access key in your terminal by

  ```
    aws configure

  ```
  ![](https://github.com/AliKhamed/ivolve_labs/blob/main/aws/lab4/screenshots/configure.png)
 

### Step2: Create s3 bucket

  ```
    aws s3api create-bucket --bucket your-bucket-name --region us-east-1 
  ```
  ![](https://github.com/AliKhamed/ivolve_labs/blob/main/aws/aws/lab4/screenshots/s31.png)

### Step3: Enable versioning

  ```
    aws s3api put-bucket-versioning --bucket your-bucket-name --versioning-configuration Status=Enabled

  ```
  ![](https://github.com/AliKhamed/ivolve_labs/blob/main/aws/lab4/screenshots/version.png)
  
### Step4: Create another bucket for logging and set their policy

  First create another bucket to logging by 
  ```
    aws s3api create-bucket --bucket alikhames010644-lab4-log-bucket --region us-east-1

  ```
  ![](https://github.com/AliKhamed/ivolve_labs/blob/main/aws/lab4/screenshots/s3.2.png)

  And create policy file by 

 
  ![](https://github.com/AliKhamed/ivolve_labs/blob/main/aws/lab4/screenshots/logs2.png)
  And file.json content
  ![](https://github.com/AliKhamed/ivolve_labs/blob/main/aws/lab4/screenshots/logpolicy.png)

  And create logging.json file to configure bitween to buckets

   ![](https://github.com/AliKhamed/ivolve_labs/blob/main/aws/lab4/screenshots/logs3.png)
   And file.json content
   ![](https://github.com/AliKhamed/ivolve_labs/blob/main/aws/lab4/screenshots/logs4.png)

### Step5: Upload and download file to your bucket

by using 
![](https://github.com/AliKhamed/ivolve_labs/blob/main/aws/lab4/screenshots/download.png)
![](https://github.com/AliKhamed/ivolve_labs/blob/main/aws/lab4/screenshots/upload.png)

## Console GUI Check

![](https://github.com/AliKhamed/ivolve_labs/blob/main/aws/lab4/screenshots/console1.png)
![](https://github.com/AliKhamed/ivolve_labs/blob/main/aws/lab4/screenshots/console2.png)
