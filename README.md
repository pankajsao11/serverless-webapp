# serverless-webapp

Overview: This serverless web application is designed to handle user registrations. It leverages AWS services to ensure scalability, low maintenance, and cost-efficiency. The main components include AWS Lambda for backend processing, API Gateway for routing and managing API requests, DynamoDB for storing user data, and CloudWatch Logs for monitoring and debugging.

![serverless-webapp](https://github.com/user-attachments/assets/b9bcbc3e-bc2e-40cc-ba1b-c3a4506a301c)


Components:

## AWS Lambda: 
AWS Lambda is a serverless compute service that allows you to run code without provisioning or managing servers. Lambda runs code in response to events from various AWS services or custom applications.
Purpose: Acts as the backend processing logic for handling registration requests.
Functionality: Validates input, processes the registration logic, and stores user data in DynamoDB.

https://docs.aws.amazon.com/lambda/latest/dg/concepts-basics.html
![lambda-a](https://github.com/user-attachments/assets/0d384db6-4b47-42ae-9b7f-9d484e84cb8d)
![lambda-b](https://github.com/user-attachments/assets/41cdb6ea-9ecc-4a05-81b6-bd1a5b1a8da4)

Its three main components are:
```
Function: this is where the actual code that performs the task lives.
Configuration: This component specifies how the function is to be executed.
Event Source: This is the event that triggers the function and can be triggered by multiple AWS services or a third-party service. It is an optional component; it does not have to be added in all cases.
Version: versions are used to manage the deployment of your Lambda functions. Each version of a Lambda function is immutable and has a unique ARN (Amazon Resource Name). This allows you to maintain multiple versions of your function code and configuration, and to roll back to a previous version if needed.
Aliase: A Lambda alias is a pointer to a function version that you can update. The function’s users can access the function version using the alias Amazon Resource Name (ARN). When you deploy a new version, you can update the alias to use the new version, or split traffic between two versions.
```

## API Gateway:
Amazon API Gateway is a fully managed service that enables developers to create, publish, maintain, monitor, and secure APIs at any scale.
Types of APIs: REST APIs, WebSocket APIs, HTTP APIs. Handles traffic management, authorization, access control, throttling, and monitoring. Offers caching capabilities to improve performance. 
"Throttling" generally refers to slowing down or limiting the rate at which something happens. Throttling is a mechanism used to control the rate of incoming requests to a service to prevent overload and ensure fair usage.
Provides API versioning and stage management
Purpose: Serves as the entry point for HTTP requests to the Lambda function.
Functionality: Routes HTTP POST requests to the Lambda function.

![api-a](https://github.com/user-attachments/assets/7763c47b-6dbe-4a95-8d3a-1efdd0619efe)
![api-b](https://github.com/user-attachments/assets/87699145-403e-46c3-8b15-ea2e8bc6effb)

## REST API
A REST API, or RESTful API, is a type of application programming interface that uses HTTP requests to access and use data. The "REST" stands for Representational State Transfer, which is an architectural style for networked applications. REST APIs use standard HTTP methods and are widely used for web and mobile applications. 

How a REST API works :-
```
A REST API enables communication between a client and a server. 
Request: A client (e.g., a web browser or mobile app) sends an HTTP request to an API endpoint (a URL) to perform a specific action.
Resource: The endpoint URL identifies the resource—any piece of content or data on the server that the client wants to access.
Method: The request includes an HTTP method, which tells the server what kind of operation to perform. These commonly correspond to CRUD (Create, Read, Update, Delete) actions.
Response: The server processes the request and sends a response back to the client. This includes an HTTP status code indicating success or failure, and often a representation of the resource, typically in JSON format.
```

Common HTTP methods:-
```
REST APIs use standard HTTP methods to define the action for a given request: 
GET: Retrieves a representation of a resource. This is used to read data.
POST: Creates a new resource on the server.
PUT: Replaces an existing resource with new data.
PATCH: Applies partial updates to a resource.
DELETE: Removes a resource.
```
```
#CORS: CORS (Cross-Origin Resource Sharing) is a security feature implemented by web browsers that allows or denies requests for resources from one domain to be made from a different domain. It is a mechanism that allows web servers to specify which domains are permitted to access the resources they serve.
```

## DynamoDB:
Amazon DynamoDB is a fully managed NoSQL database service serverless database. Supports both key-value and document data models. Provides consistent, single-digit millisecond latency at any scale, Automatic scaling to handle varying levels of traffic.
Purpose: Stores user registration data.
Functionality: Provides scalable and high-speed storage for user data.

![dynamodb-1](https://github.com/user-attachments/assets/5780fe7c-3a19-4301-9cd0-df998951ac4d)

Global Secondary Indexes (GSIs) in Amazon DynamoDB are a powerful feature that allows you to efficiently query data using attributes other than the table's primary key. GSIs enable flexible and efficient querying of data based on attributes that are not part of the table's primary key.

![db-data](https://github.com/user-attachments/assets/c40b1db5-4172-4e8c-a42e-5f2567ed6d62)


## CloudWatch Logs:
CloudWatch Logs is a fully managed service that enables you to centralize, monitor, and store log files from various AWS services, applications, and systems. Log events: Individual records of activity, each with a timestamp and raw message. Log streams: Sequences of log events from the same source. Log groups: Collections of log streams sharing the same retention, monitoring, and access control settings. 
Purpose: Monitors and logs Lambda function execution for debugging and performance analysis.
Functionality: Automatically captures logs generated by the Lambda function.

![cw-lg](https://github.com/user-attachments/assets/8b829a07-68be-4cac-8291-8448049a3f7f)
![cw-logs](https://github.com/user-attachments/assets/a960006a-d647-4ea4-b5be-c96283c3b8c0)


## IAM Role and Policies:
An IAM role is an AWS identity with specific permissions that can be assumed by AWS services, applications, or users. Roles provide temporary security credentials, eliminating the need for long-term access keys. Policies are JSON documents that define permissions for AWS resources and actions.
Purpose: Grants necessary permissions to the Lambda function.
Functionality: Ensures Lambda can interact with DynamoDB and log to CloudWatch.

![iam-role](https://github.com/user-attachments/assets/8f3fb0cd-389d-412f-8fd8-8f4d06f49b4b)

## S3 bucket:
Purpose: For storing lambda code in zip format and frontend codes for application.
Functionality: Static website hosting and lambda code deployment.

![s3-a](https://github.com/user-attachments/assets/c12ce3d1-f5c7-4178-88ff-2768eaac9d45)
![s3-b](https://github.com/user-attachments/assets/0e3d7a8d-51dc-47b0-9a58-4216492c67f7)


This setup creates a scalable and maintainable serverless registration form using AWS services, all managed through Terraform for easy deployment and infrastructure-as-code best practices.
![website](https://github.com/user-attachments/assets/1ac1f4f3-4b54-46d1-be0a-f87465d776e8)
