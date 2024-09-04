# AWS Auto Scaling Web Server Project

## Overview
This project demonstrates how to set up an AWS Auto Scaling Group to automatically scale a web server based on traffic demands. It includes a secure network architecture with public and private subnets, an Application Load Balancer (ALB), and appropriate scaling policies.

## Features
- Horizontal scaling with Auto Scaling Group
- Secure infrastructure with private subnets and security groups
- Application Load Balancer (ALB) for traffic distribution
- Cost optimization with scaling policies
- Automated server setup with EC2 UserData

## Infrastructure Setup

### 1. VPC and Subnet Configuration
- Create a VPC with public and private subnets across multiple Availability Zones.

### 2. Security Groups
- Configure security groups to restrict access to the instances and allow only necessary traffic.

### 3. Launch Template
- Create a Launch Template with the AMI, instance type, and UserData script.

### 4. Auto Scaling Group
- Set up the Auto Scaling Group with the Launch Template and attach the ALB.

### 5. Scaling Policies
- Configure scaling policies using CloudWatch Alarms or Target Tracking.

## Deployment

### Prerequisites
- AWS CLI configured
- Terraform (if using infrastructure as code)

### Steps to Deploy
1. Clone the repository:
    ```bash
    git clone https://github.com/yourusername/AWS-AutoScaling-Web-Server.git
    cd AWS-AutoScaling-Web-Server
    ```
2. Apply infrastructure (if using Terraform):
    ```bash
    terraform init
    terraform apply
    ```
3. Verify deployment in the AWS Management Console.

## Testing the Setup
- Simulate traffic using a load testing tool like Apache JMeter to trigger scaling.
- Monitor Auto Scaling activities in CloudWatch.

## Security Considerations
- Instances are secured in private subnets.
- Security groups restrict inbound and outbound traffic.

## Cost Management
- Instances are scaled down during low traffic periods to save costs.

## Conclusion
This project demonstrates the fundamental concepts of cloud infrastructure management, with a focus on scalability, security, and cost optimization. 
## License
[MIT](LICENSE)
