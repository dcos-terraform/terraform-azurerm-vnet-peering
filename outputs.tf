output "local_peering_id" {
  description = "Local peering ID"
  value       = "${azurerm_virtual_network_peering.local.id}"
}

output "remote_peering_id" {
  description = "Remote peering ID"
  value       = "${azurerm_virtual_network_peering.remote.id}"
}
