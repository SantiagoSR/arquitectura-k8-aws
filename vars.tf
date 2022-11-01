variable "access_key" {
  default = ""
}
variable "secret_key" {
    default = ""
}

variable "instance_project" {
  description = "Name of the project"
  type        = string
  default     = "ramp-up-devops"
}
variable "instance_responsible" {
  description = "Responsible for the creation of the resources"
  type        = string
  default     = "santiago.santacruzr"
}
variable "eks_cluster_name" {
  description = "Name of the eks cluster"
  type        = string
  default     = "eks_cluster_ssr"
}
variable "eks_worker_name_1" {
  description = "Name of the eks cluster"
  type        = string
  default     = "eks_worker"
}
variable "eks_worker_name_2" {
  description = "Name of the eks cluster"
  type        = string
  default     = "eks_worker_2"
}
variable "load_balancer_sg" {
  description = "Responsible for the creation of the resources"
  type        = string
  default     = "sg_load_balancer_ssr"
}

variable "efs_name" {
  description = "Name of the eks cluster"
  type        = string
  default     = "mysql-data-disk"
}
variable "eks_efs_sg" {
  description = "Name of the sg"
  type        = string
  default     = "sg_efs_ssr"
}