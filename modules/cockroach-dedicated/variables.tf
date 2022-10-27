variable "cluster_name" {
  type = string
  nullable = false
}

variable "sql_user_name" {
  type = string
  nullable = false
  default = "maxroach"
}

variable "sql_user_password" {
  type = string
  nullable = false
  sensitive = true
}

variable "cloud_provider" {
  type = string
  nullable = false
  default = "GCP"
}

variable "cloud_provider_regions_to_be_fixed" {
  type = list(string)
  nullable = false
  default = ["us-east1"]
}

variable "cloud_provider_region" {
  type = string
  default = "us-east1"
}

variable "cluster_nodes" {
  type = number
  nullable = false
  default = 1
}

variable "storage_gib" {
  type = number
  nullable = false
  default = 20
}

variable "machine_type" {
  type = string
  nullable = false
  default = "n1-standard-2"
}

variable allow_list_name {
  type = string
  nullable = false
  default = "default-allow-list"
}

variable cidr_ip {
  type = string
  nullable = false
}

variable cidr_mask {
  type = number
  nullable = false
}


variable "ngw_ip" {
  
}