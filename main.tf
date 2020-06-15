/**
 * [![Build Status](https://jenkins-terraform.mesosphere.com/service/dcos-terraform-jenkins/buildStatus/icon?job=dcos-terraform%2Fterraform-azurerm-vnet-peering%2Fsupport%252F0.2.x)](https://jenkins-terraform.mesosphere.com/service/dcos-terraform-jenkins/job/dcos-terraform/job/terraform-azurerm-vnet-peering/job/support%252F0.2.x/)
 *
 * Azure VNET Peering
 * =============================
 *
 * Creates an Azure VNET peering between two networks, allows virtual network access and forwards traffic
 *
 * EXAMPLE
 * -------
 *
 * ```hcl
 * module "vnet-peering" {
 *   source  = "dcos-terraform/vnet-peering/azurerm"
 *   version = "~> 0.2.0"
 *
 *   cluster_name               = "${var.cluster_name}"
 *   local_region_network       = "master"
 *   local_resource_group_name  = "rg-master"
 *   local_vnet_name            = "${var.local_virtual_network_name}"
 *   local_vnet_id              = "${var.local_virtual_network_id}"
 *   remote_region_network      = "eus"
 *   remote_resource_group_name = "rg-eus-private-agents"
 *   remote_vnet_name           = "${var.remote_virtual_network_name}"
 *   remote_vnet_id             = "${var.remote_virtual_network_id}"
 * }
 * ```
 */

provider "azurerm" {
  version = "~> 1.0"
}

resource "azurerm_virtual_network_peering" "local" {
  name                         = "${var.cluster_name}-${var.local_region_network}-${var.remote_region_network}"
  resource_group_name          = var.local_resource_group_name
  virtual_network_name         = var.local_vnet_name
  remote_virtual_network_id    = var.remote_vnet_id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
}

resource "azurerm_virtual_network_peering" "remote" {
  name                         = "${var.cluster_name}-${var.remote_region_network}-${var.local_region_network}"
  resource_group_name          = var.remote_resource_group_name
  virtual_network_name         = var.remote_vnet_name
  remote_virtual_network_id    = var.local_vnet_id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
}
