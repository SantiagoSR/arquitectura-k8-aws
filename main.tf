provider "aws" {
  region  = "us-west-1"
  #shared_credentials_files = ["/var/lib/jenkins/.aws/credentials"]
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"

  default_tags {
    tags = {
      project     = var.instance_project,
      responsible = var.instance_responsible
    }
  }
}
terraform {
  backend "s3" {
    bucket = "ramp-up-devops-psl"
    key    = "santiago.santacruzr/terraform_jenkins"
    region = "us-west-1"
  }
}

module "security_groups" {
  source = "./aws-security-group" 
  instance_project = var.instance_project
  instance_responsible = var.instance_responsible
  load_balancer_sg = var.load_balancer_sg
  eks_cluster_name = var.eks_cluster_name
  
}


module "eks" {
  source = "./aws-eks"
  worker_group_mgmt_id=module.security_groups.worker_group_mgmt
  eks_cluster_name = var.eks_cluster_name
  instance_responsible = var.instance_responsible
  instance_project = var.instance_project
  eks_worker_name_1 = var.eks_worker_name_1
  eks_worker_name_2 = var.eks_worker_name_2
  load_balancer_sg_id = module.security_groups.load_balancer_sg_id
  
}
