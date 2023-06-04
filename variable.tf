## RDS variables
variable "rds-postgres-db-username" {
    type = string
    default = "postgress"
}

variable "rds-db-password" {
    default = "Admin123"
}

variable "rds-postgres-db-name" {
    default = "postgress"
}
variable "rds-mysql-db-username" {
    default = "admin"
}
variable "ami" {
    default = "ami-078efad6f7ec18b8a"
}
variable "instance_type" {
    default = "t2.micro"
}
variable "key_name" {
    default = "Subramani"
}

