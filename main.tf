module "aws_infra" {
    source ="./modules/aws_infra"

    eks_cluster_name = var.eks_cluster_name
    region = var.region
    vpc_name = var.vpc_name
}

module "cockroach-dedicated" {
  source = "./modules/cockroach-dedicated"

cluster_name = var.cluster_name
sql_user_name = var.sql_user_name
sql_user_password = var.sql_user_password
cloud_provider = var.cloud_provider
cloud_provider_region = var.cloud_provider_region
cluster_nodes = var.cluster_nodes
storage_gib = var.storage_gib
machine_type = var.machine_type
cidr_ip = var.cidr_ip
cidr_mask = var.cidr_mask
ngw_ip = module.aws_infra.ngw_ip[0]
}