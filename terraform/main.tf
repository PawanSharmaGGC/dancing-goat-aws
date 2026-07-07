module "networking" {
  source       = "./modules/networking"
  project_name = var.project_name
}

module "rds" {
  source             = "./modules/rds"
  project_name       = var.project_name
  private_subnet_ids = module.networking.private_subnet_ids
  sg_db_id           = module.networking.sg_db_id
  db_username        = var.db_username
  db_password        = var.db_password
}

module "ecr" {
  source       = "./modules/ecr"
  project_name = var.project_name
}

module "alb" {
  source            = "./modules/alb"
  project_name      = var.project_name
  vpc_id            = module.networking.vpc_id
  public_subnet_ids = module.networking.public_subnet_ids
  sg_alb_id         = module.networking.sg_alb_id
}

module "ecs" {
  source               = "./modules/ecs"
  project_name         = var.project_name
  aws_region           = var.aws_region
  ecr_repository_url   = module.ecr.repository_url
  private_subnet_ids   = module.networking.private_subnet_ids
  sg_app_id            = module.networking.sg_app_id
  target_group_arn     = module.alb.target_group_arn
  db_connection_string = "Server=${module.rds.endpoint},1433;Database=${var.db_name};User Id=${var.db_username};Password=${var.db_password};TrustServerCertificate=True;Encrypt=True;"
}
