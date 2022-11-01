resource "aws_efs_file_system" "mysql-data-disk" {
   creation_token = "eks_mysql-data-disk"
   performance_mode = "generalPurpose"
   throughput_mode = "bursting"
   encrypted = "true"
 tags = {
     Name = var.efs_name
   }
 }

resource "aws_efs_mount_target" "mysql-data-disk" {
   file_system_id  = aws_efs_file_system.mysql-data-disk.id
   subnet_id = "subnet-008002bac07e1803b"
   security_groups = ["${var.efs_sg}"]
 }
