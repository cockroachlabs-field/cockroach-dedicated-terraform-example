
resource "cockroach_cluster" "cockroach" {
  name           = var.cluster_name
  cloud_provider = var.cloud_provider
  dedicated = {
    storage_gib  = var.storage_gib
    machine_type = var.machine_type
  }
  regions = [
    for r in var.cloud_provider_region : {
      name       = r,
      node_count = var.cluster_nodes
    }
  ]
}



resource "cockroach_allow_list" "cockroach" {
  depends_on = [
    cockroach_cluster.cockroach
  ]
  name = var.allow_list_name
  cidr_ip = var.ngw_ip
  cidr_mask = "32"
  ui = true
  sql = true
  id = cockroach_cluster.cockroach.id
}

resource "cockroach_sql_user" "cockroach" {
  name = var.sql_user_name
  password = var.sql_user_password
  id = cockroach_cluster.cockroach.id
}