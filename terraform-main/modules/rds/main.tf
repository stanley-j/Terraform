# Create a Database instance
resource "aws_db_instance" "db_instance" {
  allocated_storage      = var.allocated_storage
  db_name                = var.db_name
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  username               = var.username
  password               = var.password
  parameter_group_name   = var.parameter_group_name
  db_subnet_group_name   = var.db_subnet_group_name
  vpc_security_group_ids = [var.db_sg_id]
  skip_final_snapshot    = var.skip_final_snapshot
}

#Create RDS instance subnet group
resource "aws_db_subnet_group" "db_sub_grp" {
  name       = var.name
  subnet_ids = [var.pri1_sub_id, var.pri2_sub_id]

}  
