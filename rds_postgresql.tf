data "aws_subnets" "private_subnets" {
  filter {
    name   = "tag:type"
    values = ["private"]
  }
}

data "aws_security_groups" "eks_security_groups" {
  filter {
    name   = "tag:aws:eks:cluster-name"
    values = ["dotcluster"]
  }
}

resource "aws_db_subnet_group" "postgresql_rds_subnet_group" {
  name       = "postgresql_rds-subnet-group"
  subnet_ids = data.aws_subnets.private_subnets.ids
}

resource "aws_db_instance" "media-management-db" {
  identifier              = "dotvideos-pgsql"
  db_name                 = "dotvideosMediaManagement"
  engine                  = "postgres"
  instance_class          = "db.t4g.micro"
  username                = var.mediamanagement_dbuser
  password                = var.mediamanagement_dbpassword
  vpc_security_group_ids  = data.aws_security_groups.eks_security_groups.ids
  db_subnet_group_name    = aws_db_subnet_group.postgresql_rds_subnet_group.name
  allocated_storage       = 20
  skip_final_snapshot     = true
  backup_retention_period = 0
  apply_immediately       = true
}

output "mediamanagement_db_address" {
  value = aws_db_instance.media-management-db.address
}