module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "prod-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b",]
  private_subnets = ["10.0.4.0/23","10.0.10.0/23","10.0.14.0/23","10.0.20.0/23", "10.0.25.0/27", "10.0.30.0/27"]
  public_subnets  = ["10.0.1.0/28", "10.0.3.0/28"]

  enable_nat_gateway = true
  single_nat_gateway = true
  
 #enable_vpn_gateway = false

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}