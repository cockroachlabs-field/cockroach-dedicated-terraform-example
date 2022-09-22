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
}

module "aws_infra" {
    source ="./modules/aws_infra"
}

# resource "null_resource" "kube_config_set"  {
#   # ...

#   provisioner "local-exec" {
#     command = "aws eks --region $(terraform output region) update-kubeconfig --name $(terraform output cluster_name)"
#   }
#   depends_on = [
#     module.aws_infra
#   ]
# }