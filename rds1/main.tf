provider "aws" {
    region = "us-east-1"
  
}

resource "aws_db_instance" "default"{
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  username             = "foo"
  password             = "foobarbaz"
  parameter_group_name = "default.mysql5."
  skip_final_snapshot  = true
  backup_retention_period = 0
  identifier = "dev-database"
}
resource "aws_sns_topic" "user_updates" {
  name            = "user-updates-topic"
  delivery_policy = <<EOF
{
  "http": {
    "defaultHealthyRetryPolicy": {
      "minDelayTarget": 20,
      "maxDelayTarget": 20,
      "numRetries": 3,
      "numMaxDelayRetries": 0,
      "numNoDelayRetries": 0,
      "numMinDelayRetries": 0,
      "backoffFunction": "linear"
    },
    "disableSubscriptionOverrides": false,
    "defaultThrottlePolicy": {
      "maxReceivesPerSecond": 1
    }
  }
}
EOF
}
resource "aws_security_group" "default" {
  name        = "website"
  description = "Allow_httpd and ssh_traffic"
 # vpc_id      = aws_vpc.main.id
  
   ingress  {
    cidr_blocks = [ "0.0.0.0/0" ]
    from_port = 80
    to_port = 80
    protocol = "tcp"
   }
    ingress  {
      cidr_blocks = ["0.0.0.0/0"]
      from_port = 22
      to_port = 22
      protocol = "tcp"
    }
    egress {
      cidr_blocks = ["0.0.0.0/0"]
      from_port = 0
      to_port = 0
      protocol = "-1"
    }
  tags = {
    Name = "website"
  }
}
resource "aws_ebs_volume" "ebs1" {
  availability_zone = "us-east-1"
  size              = 10
   
  tags = {
    Name = "HelloWorld"
    Enviroment = "dev"
    instance_type = t2.micro
  }
}
resource "aws_ebs_volume" "ebs1" {
  availability_zone = var.availability_zone
  size             = var.size
  
  tags = {
    name          = var.name
    
  }
}