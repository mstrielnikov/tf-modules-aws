resource "aws_vpc" "vpc_eks_main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "vpc_eks_main"
    Env = var.profile
  }
}

resource "aws_subnet" "subnet_eks_private" {
  vpc_id                          = aws_vpc.vpc_eks_main.id
  cidr_block                      = aws_vpc.vpc_eks_main.cidr_block
  
  tags = {
    Name = "subnet_eks_private"
    Env = var.profile
  }
}
