# Kubernetes provider
# https://learn.hashicorp.com/terraform/kubernetes/provision-eks-cluster#optional-configure-terraform-kubernetes-provider
# To learn how to schedule deployments and services using the provider, go here: https://learn.hashicorp.com/terraform/kubernetes/deploy-nginx-kubernetes
# The Kubernetes provider is included in this file so the EKS module can complete successfully. Otherwise, it throws an error when creating `kubernetes_config_map.aws_auth`.
# You should **not** schedule deployments and services in this workspace. This keeps workspaces modular (one for provision EKS, another for scheduling Kubernetes resources) as per best practices.
provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
}

provider "aws" {
  region = var.region
}

data "aws_availability_zones" "available" {}

locals {
  cluster_name = var.eks_cluster_name
  region = var.region
}

resource "random_string" "suffix" {
  length  = 8
  special = false
}

locals {
  kubeconfig = templatefile("templates/kubeconfig.tpl", {
    kubeconfig_name                   = "kubeconfig_file"
    endpoint                          = module.eks.cluster_endpoint
    cluster_auth_base64               = module.eks.cluster_certificate_authority_data
    aws_authenticator_command         = "aws"
    aws_authenticator_command_args    = ["--region", local.region, "eks", "get-token", "--cluster-name", local.cluster_name]
    aws_authenticator_additional_args = []
    aws_authenticator_env_variables   = {}
  })
}

output "kubeconfig" { value = local.kubeconfig }

resource "local_file" "kubeconfig" {
    content     = "${local.kubeconfig}"
    filename = "${path.module}/kubeconfig"
}