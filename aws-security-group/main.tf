
resource "aws_security_group" "worker_group_mgmt" {
  name        = "private-web-server-ssr"
  description = "Allow inbound traffic for cluster"
  vpc_id      = "vpc-01453eef0619fc56d"
  ingress {
    description = "Allow ssh from bastion"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["186.80.28.33/32"]
  }
  
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name        = var.eks_cluster_name
    responsible = var.instance_project,
    project = var.instance_responsible
  }
}


resource "aws_security_group" "load-balancer-sg" {
  name        = "load-balancer-sg"
  description = "Allow traffic from client"
  vpc_id      = "vpc-01453eef0619fc56d"
  ingress {
    description = "Allow TCP 3030 from clients"
    from_port   = 3030
    to_port     = 3030
    protocol    = "tcp"
    cidr_blocks = ["186.80.28.33/32"]
  }
  ingress {
    description = "Allow TCP 3000 from clients"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["186.80.28.33/32"]
  }
  ingress {
    description = "Allow HTTP connection from clients"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["186.80.28.33/32"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name        = var.load_balancer_sg,
    responsible = var.instance_project,
    project = var.instance_responsible
  }
}

resource "aws_security_group" "efs_eks" {
  name        = "efs-eks-ssr"
  description = "Allow inbound traffic for efs"
  vpc_id      = "vpc-01453eef0619fc56d"
  ingress {
    description = "Allow ssh from bastion"
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }
  
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name        = var.eks_cluster_name
    responsible = var.instance_project,
    project = var.instance_responsible
  }
}