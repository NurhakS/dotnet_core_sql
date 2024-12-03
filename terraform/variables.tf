# Resource group
variable "resource_group_name" {
  description = "Name of the Azure resource group"
  default     = "terraform-rg"
}

variable "location" {
  description = "Azure location for resources"
  default     = "East US"
}

# Virtual machine
variable "vm_name" {
  description = "Name of the VM"
  default     = "ubuntu-docker-vm"
}
variable "sql_admin_password" {
  description = "The administrator password for the SQL server"
  type        = string
  sensitive   = true
  default = "admin"
}
variable "sql_admin_username" {
  description = "The administrator username for the SQL server"
  type        = string
  sensitive   = true
  default = "admin"
}
variable "vm_size" {
  description = "Azure VM size"
  default     = "Standard_B2s"
}

variable "admin_username" {
  description = "Admin username for the VM"
  default     = "adminuser"
}

variable "admin_ssh_public_key" {
  description = "SSH public key for VM authentication"
  type        = string
}

# Azure Container Registry
variable "acr_name" {
  description = "Name of the Azure Container Registry"
  default     = "myacrregistry"
}

variable "acr_sku" {
  description = "SKU for the Azure Container Registry"
  default     = "Basic"
}
