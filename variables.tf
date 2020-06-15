variable "cluster_name" {
  description = "Name of the DC/OS cluster"
}

variable "local_region_network" {
  description = "Local region network name, for naming the VNET peering resource"
  type        = string
}

variable "local_resource_group_name" {
  description = "Local resource group name"
  type        = string
}

variable "local_vnet_name" {
  description = "Local VNET name"
  type        = string
}

variable "local_vnet_id" {
  description = "Local VNET ID"
  type        = string
}

variable "remote_region_network" {
  description = "Remote region network name, for naming the VNET peering resource"
  type        = string
}

variable "remote_resource_group_name" {
  description = "Remote resource group name"
  type        = string
}

variable "remote_vnet_name" {
  description = "Remote VNET name"
  type        = string
}

variable "remote_vnet_id" {
  description = "Remote VNET ID"
  type        = string
}
