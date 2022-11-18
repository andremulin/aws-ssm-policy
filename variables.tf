variable "name" {
  type        = string
  description = "(Optional) A name used to create roles and policies"
  default     = ""
}

variable "vpcs" {
  type = list(object({
    id                 = string
    security_group_ids = list(string)
  }))
  description = "(Optional) List of VPC IDs which will be create a VPC Endpoint"
  default = [{
    id                 = ""
    security_group_ids = [""]
  }]
}