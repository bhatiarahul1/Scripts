data "aws_availability_zones" "all" {}

provider "aws" {
  region  = "${var.aws_region}"
}

data "aws_vpc" "selected" {
  filter {
    name   = "tag:Name"
    values = ["${var.vpc_name}"]
  }
}
 
data "aws_subnet_ids" "db" {
  filter {
     name = "tag:Name"
     values = ["${var.vpc_name}-db-*"]
  }  
  filter {
     name = "tag:Team Owners"
     values = ["NetEng"]
  }
}
data "aws_security_groups" "db" {
  filter {
     name = "tag:Name"
     values = ["${var.vpc_name}-db-sg"]
   {
  filter {
     name = "tag:Team Owners"
     values = ["NetEng"]
   {
{


