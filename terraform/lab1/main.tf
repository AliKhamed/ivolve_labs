provider "aws" {
  region = var.region
  profile = "default"
}

resource "aws_vpc" "vpc" {
    cidr_block       = var.vpc_cidr
    enable_dns_hostnames = true

    tags = {
    Name = var.vpc_name
    }
}

resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.public_subnet_cidrs
  availability_zone = var.public_subnet_azs
  
  tags = {
    Name = "Public_Subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  count             = 2
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.private_subnets["subnet_cidrs"][count.index]
  availability_zone = var.private_subnets["subnet_azs"][count.index]
  
  tags = {
    Name = "Private_Subnet-${count.index + 1}"
  }
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.vpc.id
    tags = {
      Name: "${var.vpc_name}-igw"
    }
}
resource "aws_route_table" "igw-rtw" {
    vpc_id = aws_vpc.vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
    tags = {
      Name: "${var.vpc_name}-rtb-public"
    }
}
resource "aws_route_table_association" "rtb_igw_association" {
    subnet_id = aws_subnet.public_subnet.id
    route_table_id = aws_route_table.igw-rtw.id
}


########################################################
# sg
resource "aws_security_group" "sg" {
  vpc_id      = aws_vpc.vpc.id
 
}

resource "aws_vpc_security_group_ingress_rule" "ingress" {
  count = var.sg["ingress_count"][0]["count"]
  security_group_id = aws_security_group.sg.id
  from_port         = var.sg["ingress_rule"][count.index]["port"]
  to_port           = var.sg["ingress_rule"][count.index]["port"]
  ip_protocol       = var.sg["ingress_rule"][count.index]["protocol"]
  cidr_ipv4         = var.sg["ingress_rule"][count.index]["cidr"]
  tags = {
    Name = "ingress"
  }
}

resource "aws_vpc_security_group_egress_rule" "egress" {
  security_group_id = aws_security_group.sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" 
}
###########################################################
# ec2

resource "aws_instance" "ec2_public" {
  ami             = var.ami
  instance_type   = var.instance_type
  subnet_id       = aws_subnet.public_subnet.id
  associate_public_ip_address = true
  security_groups = [aws_security_group.sg.id]
  tags = {
    Name = "public_ec2"
  }
}

  resource "aws_security_group" "rds_sg" {
  name        = "rds_sg"
  description = "Security group for RDS instance"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "rds_sg"
  }
}
resource "aws_db_subnet_group" "rds-subnet-name" {

  subnet_ids = aws_subnet.private_subnet[*].id
  tags = {
    Name = "my-db-subnet-group"
  }
}

resource "aws_db_instance" "rds-ec2" {
  
  allocated_storage    = var.allocated_storage
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  db_name              = var.db_name
  username             = var.db_username
  password             = var.db_password
  parameter_group_name = var.parameter_group_name
  skip_final_snapshot  = var.skip_final_snapshot
  db_subnet_group_name = aws_db_subnet_group.rds-subnet-name.name

  vpc_security_group_ids = [aws_security_group.rds_sg.id]

  tags = {
    Name = var.db_instance_name
  }
}
