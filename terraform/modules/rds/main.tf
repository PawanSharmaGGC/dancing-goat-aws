resource "aws_db_subnet_group" "main" {
  name       = "${var.project_name}-db-subnets"
  subnet_ids = var.private_subnet_ids
}

resource "aws_db_instance" "main" {
  identifier              = "${var.project_name}-db"
  engine                  = "sqlserver-ex"
  engine_version          = "16.00.4255.1.v1"
  instance_class          = "db.t3.micro"
  allocated_storage       = 20
  storage_type            = "gp3"
  iops                    = 3000
  storage_throughput      = 125 
  username                = var.db_username
  password                = var.db_password
  db_subnet_group_name    = aws_db_subnet_group.main.name
  vpc_security_group_ids  = [var.sg_db_id]
  license_model           = "license-included"
  backup_retention_period = 7
  publicly_accessible     = true
  multi_az                = false
  skip_final_snapshot     = true
  allow_major_version_upgrade = true
  option_group_name           = "dancing-goat-s3-restore-16"
  apply_immediately           = true
}
