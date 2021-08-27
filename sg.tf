resource "aws_security_group" "eks_sg" {
  vpc_id = aws_vpc.vpc_eks_main.id
  name = "${var.profile}-eks-security-group"
  description = "${var.profile} eks security group"
}

resource "aws_security_group_rule" "eks_sg_ingress_all" {
  type = "ingress"
  from_port = 0
  to_port = 0
  protocol = -1
  cidr_blocks = ["0.0.0.0/0"]
  description = "Allow all income"
  security_group_id = aws_security_group.eks_sg.id
}

resource "aws_security_group_rule" "eks_sg_egress_all" {
  type = "egress"
  from_port = 0
  to_port = 0
  protocol = -1
  cidr_blocks = ["0.0.0.0/0"]
  description = "Allow all outgoing"
  security_group_id = aws_security_group.eks_sg.id    
}