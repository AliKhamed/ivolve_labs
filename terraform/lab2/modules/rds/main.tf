resource "aws_security_group" "rds_sg" {
  vpc_id      = var.vpc_id

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

  subnet_ids = [var.private_subnet_ids]
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