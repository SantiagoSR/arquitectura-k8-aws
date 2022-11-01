variable "instance_project" {
  description = "Name of the project"
  type        = string
}
variable "instance_responsible" {
  description = "Responsible for the creation of the resources"
  type        = string
}

variable "load_balancer_sg" {
  description = "Responsible for the creation of the resources"
  type        = string
}

variable "eks_cluster_name" {
  description = "Name of eks cluster"
  type        = string
}