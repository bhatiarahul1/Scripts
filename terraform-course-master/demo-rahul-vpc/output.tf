output "aws_vpc" {
  description = "Current aws_vpc"
  value = data.aws_vpc.selected
}
output "aws_db_subnet_ids" {
  description = "Current aws_subnet_ids"
  value = data.aws_subnet_ids.db
}
output "aws_db_security_groups" {
  description = "Current aws_security_groups"
  value = data.aws_security_groups.db
}
output "aws_availability_zones" {
  description = "Current aws_availability_zones"
  value = data.aws_availability_zones.all
}
