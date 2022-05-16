variable "prefix" {
  type        = string
  description = "custom prefix for TF created resources"
  default     = "custom-tf"
}

variable "environment" {
  type        = string
  description = "Environment definition to create resources therein"
  default     = "dev"
}
