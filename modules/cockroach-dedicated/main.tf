resource "cockroach_cluster" "cockroach" {
  name           = var.cluster_name
  cloud_provider = var.cloud_provider
  wait_for_cluster_ready = true
  create_spec = {
    dedicated: {
      region_nodes = merge(
        {
          for k in var.cloud_provider_region: k => "${var.cluster_nodes}"
        }
      )
      hardware = {
        storage_gib = var.storage_gib
        machine_spec = {
          machine_type = var.machine_type
        }
      }
    }
  }
}

# resource "cockroach_allow_list" "cockroach" {
#   name = var.allow_list_name
#   cidr_ip = var.cidr_ip
#   cidr_mask = var.cidr_mask
#   ui = true
#   sql = true
#   id = cockroach_cluster.cockroach.id
# }

resource "cockroach_sql_user" "cockroach" {
  name = var.sql_user_name
  password = var.sql_user_password
  id = cockroach_cluster.cockroach.id
}