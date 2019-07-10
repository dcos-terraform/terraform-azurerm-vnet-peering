[![Build Status](https://jenkins-terraform.mesosphere.com/service/dcos-terraform-jenkins/buildStatus/icon?job=dcos-terraform%2Fterraform-azurerm-vnet-peering%2Fsupport%252F0.2.x)](https://jenkins-terraform.mesosphere.com/service/dcos-terraform-jenkins/job/dcos-terraform/job/terraform-azurerm-vnet-peering/job/support%252F0.2.x/)

Azure VNET Peering
=============================

Creates an Azure VNET peering between two networks, allows virtual network access and forwards traffic

EXAMPLE
-------

```hcl
module "vnet-peering" {
  source  = "dcos-terraform/vnet-peering/azurerm"
  version = "~> 0.2.0"

  cluster_name               = "${var.cluster_name}"
  local_resource_group_name  = "cluster1"
  local_vnet_name            = "${var.local_virtual_network_name}"
  local_vnet_id              = "${var.local_virtual_network_id}"
  remote_resource_group_name = "cluster2"
  remote_vnet_name           = "${var.remote_virtual_network_name}"
  remote_vnet_id             = "${var.remote_virtual_network_id}"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| cluster\_name | Name of the DC/OS cluster | string | n/a | yes |
| local\_resource\_group\_name | Local resource group name | string | n/a | yes |
| local\_vnet\_id | Local VNET ID | string | n/a | yes |
| local\_vnet\_name | Local VNET name | string | n/a | yes |
| remote\_resource\_group\_name | Remote resource group name | string | n/a | yes |
| remote\_vnet\_id | Remote VNET ID | string | n/a | yes |
| remote\_vnet\_name | Remote VNET name | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| local\_peering\_id | Local peering ID |
| remote\_peering\_id | Remote peering ID |
