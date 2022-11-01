
output "load_balancer_sg_id" {
    value = aws_security_group.load-balancer-sg.id
}

output "worker_group_mgmt" {
    value = aws_security_group.worker_group_mgmt.id
}

output "efs_eks_sg_id" {
    value = aws_security_group.efs_eks.id
}
