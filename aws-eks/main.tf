resource "aws_eks_cluster" "cluster" {
  enabled_cluster_log_types = []
  name                      = var.eks_cluster_name
  role_arn                  = "arn:aws:iam::961518039473:role/eksClusterRole"
  version                   = "1.20"

  vpc_config {
    subnet_ids              = ["subnet-008002bac07e1803b", "subnet-0bc764be06c5600c9", "subnet-04f010b3a0679cae0", "subnet-070a5a6f323e8077d"]
    security_group_ids      = [var.worker_group_mgmt_id, var.load_balancer_sg_id]
    endpoint_private_access = "true"
    endpoint_public_access  = "true"
  }
}

module "eks-node-group-a" {
  source = "umotif-public/eks-node-group/aws"

  create_iam_role = false

  cluster_name = aws_eks_cluster.cluster.id

  node_group_name_prefix = "eks-test-group-ab-"
  node_role_arn          = "arn:aws:iam::961518039473:role/cluster-test-worker-nodes-NodeInstanceRole-UHJJQ67O0C9D"

  subnet_ids = ["subnet-008002bac07e1803b", "subnet-04f010b3a0679cae0"]

  desired_size = 3
  min_size     = 3
  max_size     = 4
  capacity_type = "ON_DEMAND" 
  #https://docs.aws.amazon.com/eks/latest/userguide/cni-increase-ip-addresses.html
  instance_types = ["t2.micro"]

  tags = {
        Name = "node_group_santiago_santacruz",
        responsible = var.instance_project,
        project = var.instance_responsible
    }
}