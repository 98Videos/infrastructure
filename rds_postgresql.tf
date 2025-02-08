resource "aws_db_subnet_group" "postgresql_rds_subnet_group" {
  name       = "postgresql_rds-subnet-group"
  subnet_ids = [aws_subnet.private-us-east-1a.id, aws_subnet.private-us-east-1b.id]
}

resource "aws_db_instance" "media-management-db" {
  depends_on              = [aws_eks_cluster.dotcluster]
  identifier              = "dotvideos-pgsql"
  db_name                 = "dotvideosMediaManagement"
  engine                  = "postgres"
  instance_class          = "db.t4g.micro"
  username                = var.mediamanagement_dbuser
  password                = var.mediamanagement_dbpassword
  vpc_security_group_ids  = [aws_security_group.eks_security_group.id]
  db_subnet_group_name    = aws_db_subnet_group.postgresql_rds_subnet_group.name
  allocated_storage       = 20
  skip_final_snapshot     = true
  backup_retention_period = 0
  apply_immediately       = true
}

output "mediamanagement_db_address" {
  value = aws_db_instance.media-management-db.address
}
