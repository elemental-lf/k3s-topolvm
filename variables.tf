variable "scheduler_config_version" {
  type        = string
  description = "Version of the scheduler configuration"

  validation {
    condition     = contains(["v1beta1", "v1beta2"],  var.scheduler_config_version)
    error_message = "Valid values are v1beta1 and v1beta2."
  }
}

variable "chart_version" {
  type        = string
  default     = "6.0.0"
  description = "Helm chart version of TopoLVM to deploy"
}

variable "image_tag" {
  type        = string
  default     = null
  description = "Override image tag supplied by chart"
}
