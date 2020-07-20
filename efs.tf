resource "aws_efs_file_system" "myefs" {
   creation_token = "myefs"
   performance_mode = "generalPurpose"
   throughput_mode = "bursting"
   encrypted = "true"
 tags = {
     Name = "EFS-File-System"
   }
 }
resource "aws_efs_mount_target" "efs-a" {
   file_system_id  = aws_efs_file_system.myefs.id
   subnet_id = "subnet-094a2145"
   security_groups = [aws_security_group.secgrp.id]
}
resource "aws_efs_mount_target" "efs-b" {
   file_system_id  = aws_efs_file_system.myefs.id
   subnet_id = "subnet-69d9e301"
   security_groups = [aws_security_group.secgrp.id]
}
resource "aws_efs_mount_target" "efs-c" {
   file_system_id  = aws_efs_file_system.myefs.id
   subnet_id = "subnet-f0e5588b"
   security_groups = [aws_security_group.secgrp.id]
}
