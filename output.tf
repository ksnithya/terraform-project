#outputs.tf
output "security_group_id_postgress" {
  value = aws_security_group.rds-security.id
}
output "db_instance_endpoint_postgress" {
  value = aws_db_instance.rds_postgress.endpoint
}
output "security_group_id_mysql" {
  value = aws_security_group.rds_mysql_SG.id
}
output "db_instance_endpoint_mysql" {
  value = aws_db_instance.mysql_instance.endpoint
}
output "s3_bucket_name" {
  value = aws_s3_bucket.myS3_bucket.id
}