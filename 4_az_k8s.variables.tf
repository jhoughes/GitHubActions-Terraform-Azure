#Section 5 - Azure Kubernetes cluster

variable log_analytics_workspace_name {
  description = "The full name of the Log Analytics workspace with which the solution will be linked. Changing this forces a new resource to be created."
  type        = string
}

variable log_analytics_workspace_sku {
  description = "Specifies the Sku of the Log Analytics Workspace. Possible values are 'Free', 'PerNode', 'Premium', 'Standard', 'Standalone', 'Unlimited', and 'PerGB2018'."
  type        = string
}

variable "dns_prefix" {
  description = "DNS prefix specified when creating the managed cluster. Changing this forces a new resource to be created."
  type        = string
}

variable "node_count" {
  description = "The initial number of nodes which should exist within this Node Pool."
  type        = number
}

variable "ssh_public_key" {
  description = "An ssh_key block. Only one is currently allowed. Changing this forces a new resource to be created."
  type        = string
}

variable "k8s_cluster_name" {
  description = "Name for our Kubernetes test cluster"
  type        = string
}

variable "linux_admin_username" {
  description = "Administrator user name for Linux"
  type        = string
}
