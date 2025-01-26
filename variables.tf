#kubernetes
variable "eks_role" {
  description = "role for eks and node cluster"
  type        = string
}

# AWS RDS Potgresql
variable "mediamanagement_dbuser" {
  type        = string
  description = "AWS RDS MediaManagement Database User Name"
}

variable "mediamanagement_dbpassword" {
  type        = string
  sensitive   = true
  description = "AWS RDS MediaManagement Database Password"
}
