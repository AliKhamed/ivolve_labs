vpc_name     = "nti-vpc"
vpc_cidr     = "10.0.0.0/16"
region       = "us-east-1"
ami = "ami-04b70fa74e45c3917"
instance_type = "t2.micro"

public_subnet_cidrs = "10.0.0.0/24"
public_subnet_azs   = "us-east-1a"


private_subnet_cidrs = "10.0.2.0/24"
private_subnet_azs   = "us-east-1a"


sg = {
  ingress_count = [{count = 3}]
  ingress_rule = [{
    port = 443
    protocol = "tcp"
    cidr = "0.0.0.0/0"
  } , 
  { port = 80
    protocol = "tcp"
    cidr = "0.0.0.0/0"
  },
  { port = 22
    protocol = "tcp"
    cidr = "0.0.0.0/0"
  }]
}

allocated_storage    = 20
engine               = "mysql"
engine_version       = "8.0"
instance_class       = "db.t3.micro"
db_name              = "rds"
db_username          = "admin"
parameter_group_name = "default.mysql8.0"
skip_final_snapshot  = true
db_instance_name     = "rds-db"