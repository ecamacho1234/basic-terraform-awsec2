# Basic Template deploy aws Resources

Infraestructure with Terraform

## Architect

VPC
├── Public Subnet
├── Private Subnet
├── Internet Gateway
├── Route Tables
└── EC2

## Deploy

cd environments/dev
terraform init
terraform apply

## Technology

AWS
Terraform
S3 Backend
DynamoDB locking (cloudposse)