module "vpc" {
  source = "../../modulos/vpc"
  cidr_block = "10.10.0.0/16"
  name = "${var.project_name}-vpc"

  public_subnet = "10.10.1.0/24"
  public_subnet_name = "${var.project_name}-public-subnet"
}

module "sg" {
  source = "../../modulos/security-group"
  name = "${var.project_name}-sg"
  vpc_id = module.vpc.vpc_id
  port = 80
  cidr = ["0.0.0.0/0"]
}

module "deploy_instance" {
  source = "../../modulos/ec2"
  ami = "ami-014d82945a82dfba3"
  instance_type = "t3.micro"
  subnet_id     = module.vpc.public_id
  vpc_sg_ids = [module.sg.sg_id]
  name = "${var.project_name}-ec2"
}

module "deploy_bucket" {
  source = "../../modulos/s3"
  bucket_name = "modbucket74h2i29"
}

module "terraform_state_backend" {
  source = "cloudposse/tfstate-backend/aws"
  version     = "0.38.1"
  namespace  = "portfolio75h5t5"
  stage      = "prod"
  name       = "terraformsa"
  attributes = ["state"]

  terraform_backend_config_file_path = "."
  terraform_backend_config_file_name = "backend.tf"
  force_destroy                      = false
}

output "s3_arn" {
  value = module.deploy_bucket.s3_bucket_arn
}