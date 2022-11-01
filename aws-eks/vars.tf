variable "worker_group_mgmt_id" {
  description = "id of the sg for worker group one"
  type        = string
}
variable "instance_project" {
  description = "Name of the project"
  type        = string
}
variable "instance_responsible" {
  description = "Responsible for the creation of the resources"
  type        = string
}

variable "eks_cluster_name" {
  description = "Name of eks cluster"
  type        = string
}

variable "eks_worker_name_1" {
  description = "Name of the eks cluster"
  type        = string
}

variable "eks_worker_name_2" {
  description = "Name of the eks cluster"
  type        = string
}
variable "load_balancer_sg_id" {
  description = "Name of the eks cluster"
  type        = string
}

# variable "map_users" {
#   description = "Additional IAM users to add to the aws-auth configmap."
#   type = list(object({
#     userarn  = string
#     username = string
#     groups   = list(string)
#   }))

#   default = [
#     {
#       userarn  = "arn:aws:iam::961518039473:user/santiago.santacruzr"
#       username = "santiago.santacruzr"
#       groups   = ["system:masters"]
#     },
#   ]
# }