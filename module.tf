module "sns_topic" {
    source = "terraform-aws-modules/sns/aws"

    name = "Team"

    tags = {
     Enviroment = "dev"
     terraform = true
     maxDelayTarge = 20
     minDelayTarget = 20
     numRetries = 3
     numMaxDelayRetries = 0
     numNoDelayRetries = 0
     #numMinDelayRetries = 0
     maxReceivesPerSecond = 1
    }
    
}
module "rds1" {
  source = "terraform-aws-modules/rds/aws"

  identifier = "dev-detabase"
  engine     = "mysql"
  engine_version = "5.7"
  family = "family"
 # allocated_storage = "db.t3a.small"
  instance_class = 5

  db_name = "dev-detabase"
  username = "user"
  port = 3306

  tags = {
    owner = "stephe"
    Enviroment = "dev"
  }
}
module "website_sg" {
    source = "terraform-aws-modules/security-group/aws//modules/http-80"
    name   = "website"
    description = "security group for website with http port open within vpc"
    vpc_id = "vpc_id"


   # default = true
   /*  ingress {
    cidr_block = ["0.0.0/0"]
    from_port = 80
    to_port = 80
    protocol ="tcp"
    
     }
    /* ingress  {
        cidr_block = ["0.0.0/0"]
        from_port = 22
        to_port = 22
        protocol = "tcp"
       */
}

     
 
provider "aws" {
    region = var.region
  
}
resource "aws_db_instance" "default" {
  allocated_storage = var.allocated_storage
  db_name           = var.db_name
  engine            = var.engine     
  engine_version    = var.engine_version
  instance_class    = var.instance_class 
  username          = var.username
  password          = var.password   
  parameter_group_name = var.password     
  skip_final_snapshot = var.skip_final_snapshot
  backup_retention_period = var.backup_retention_period
   
  

  identifier       = var.identifier
}
resource "aws_security_group" "default" {
  name = var.name
  description = var.description
 # vpc_id = var.vpc_id.main.id
}