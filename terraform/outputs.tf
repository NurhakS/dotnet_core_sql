output "vm_public_ip" {
  description = "Public IP of the VM"
  value       = azurerm_public_ip.public_ip.ip_address
}

output "acr_login_server" {
  description = "Login server URL for the Azure Container Registry"
  value       = azurerm_container_registry.acr.login_server
}
