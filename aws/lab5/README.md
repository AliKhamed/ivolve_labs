## Lab5 Description 

 Build a serverless application using AWS Lambda, API Gateway, and DynamoDB.

### Steps 
1. **Create role to lambda function**
2. **Create lambda function and upload python code.zip**
3. **Create dynamodb table**
4. **Create API gateway**
5. **Check App cycle**


## Solution Steps

### Step1: Create role to lambda function by


  ![](https://github.com/AliKhamed/ivolve_labs/blob/main/aws/lab5/screenshots/role.png)

  And Add permission to role DynamoDBFullAccess 

  ![](https://github.com/AliKhamed/ivolve_labs/blob/main/aws/lab5/screenshots/role2.png)
 

### Step2: Create lambda function and upload python code.zip

 
  ![](https://github.com/AliKhamed/ivolve_labs/blob/main/aws/lab5/screenshots/func1.png)
  
  #### Assign dynamoDB role that create in step 1
  
  ![](https://github.com/AliKhamed/ivolve_labs/blob/main/aws/lab5/screenshots/func2.png)
  
  #### Upload your code from your device
  
  ![](https://github.com/AliKhamed/ivolve_labs/blob/main/aws/lab5/screenshots/func3.png)

  ![](https://github.com/AliKhamed/ivolve_labs/blob/main/aws/lab5/screenshots/func4.png)

### Step3: Create dynamodb table


  ![](https://github.com/AliKhamed/ivolve_labs/blob/main/aws/lab5/screenshots/db1.png)
  
  
### Step4: Create API gateway

#### Create rest api 
  ![](https://github.com/AliKhamed/ivolve_labs/blob/main/aws/lab5/screenshots/rest.png)
#### And create two method GET and POST
  ![](https://github.com/AliKhamed/ivolve_labs/blob/main/aws/lab5/screenshots/api1.png)

  ![](https://github.com/AliKhamed/ivolve_labs/blob/main/aws/lab5/screenshots/api2.png)

 #### And deploy the post method 

  ![](https://github.com/AliKhamed/ivolve_labs/blob/main/aws/lab5/screenshots/apideploy.png)

  
### Step4: Check App cycle

 #### Copy deployed api url and check it in new tabe
  
  ![](https://github.com/AliKhamed/ivolve_labs/blob/main/aws/lab5/screenshots/test1.png)
  
  #### After writing the infomation press submit
  
  ![](https://github.com/AliKhamed/ivolve_labs/blob/main/aws/lab5/screenshots/test2.png)
  
 #### Congrats your application running well

 #### Check your data in the dynamodb table 
  
  ![](https://github.com/AliKhamed/ivolve_labs/blob/main/aws/lab5/screenshots/itemdb.png)

  #### Well Done!
  

