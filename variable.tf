variable "aws_sns_topic" {
 }
variable "name" {
  }
variable minDelayTarget {
  default = 20
}
variable "maxDelayTarget" {
  default = 20
}
variable "numRetries" {
  default = 3
}
variable "numMaxDelayRetries" {
  default = 0
}
variable "numNoDelayRetries" {
  default = 0
}
variable "numMinDelayRetries" {
  default = 0
}
#variable "numMinDelayRetries" {
 # default = 0


 variable "allocated_storage" {
 default = 10 
}
variable "backup_retention_period" {
 description = "How long backup should be kept" 
 default = 0
}
variable "db_name" {
  description = "Name of the initial database"
  default = "devdb"
}
variable "engine" {
  default = "mysql"
}
variable "engine_version" {
  default = "5.7"
}
variable "identifier" {
 default = "dev-database" 
}
variable "password" {
   sensitive = true 
  
}
variable "username" {
  sensitive = true
}
variable "instance_class" {
 default =  "db.t3.micro" 
}
variable "region" {
 default = "us-east-1"
}
variable "skip_final_snapshot" {
 default = true 
}
variable "parameter_group_name" {
 default = "default.mysql5.7" 
}
variable "Allow_httpd" {
 
}
variable "allow_ssh" {
  
}
#variable "name" {
  

variable "description" {
  
}
variable "aws_security_group" {
  default = true
}
variable "aws_ebs_volume" {
  default = "ebs1"
}


variable "size" {
  default = 10
}
variable "family" {
  default = true
  }
variable "major_engine_version" {
  nullable = false
}