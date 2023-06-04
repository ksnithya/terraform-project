
resource "aws_security_group" "rds-security" {
 #vpc_id      = module.vpc.id
  name        = "rds-security"
  description = "Allow all inbound for Postgres"
  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_instance" "rds_postgress" {
  identifier             = "rds-postgress"
  instance_class         = "db.t3.micro"
  allocated_storage      = 5
  engine                 = "postgres"
  engine_version         = "14.1"
  skip_final_snapshot    = true
  publicly_accessible    = true
  vpc_security_group_ids = [aws_security_group.rds-security.id]
  db_name                = var.rds-postgres-db-name
  username               = var.rds-postgres-db-username
  password               = var.rds-db-password
  multi_az               = true
}
resource "aws_security_group" "rds_mysql_SG" {
  name = "rds_mysql"
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
}


#create a RDS Database Instance
resource "aws_db_instance" "mysql_instance" {
  engine                 = "mysql"
  identifier             = "myrdsinstance"
  allocated_storage      = 20
  engine_version         = "5.7"
  instance_class         = "db.t3.micro"
  username               = var.rds-mysql-db-username
  password               = var.rds-db-password
  parameter_group_name   = "default.mysql5.7"
  vpc_security_group_ids = ["${aws_security_group.rds_mysql_SG.id}"]
  skip_final_snapshot    = true
  publicly_accessible    = true
  multi_az               = true
}


