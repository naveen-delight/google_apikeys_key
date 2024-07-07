variable "name" {
  description = "The name of Api key"
  type        = string
}

variable "project" {
  description = "The id of project"
  type        = string
}

variable "use_geocoding" {
  type        = bool
  description = "This to  gecoding api"
  default     = false
}

variable "use_javascript" {
  type        = bool
  description = "(optional) describe your variable"
  default     = false
}

variable "use_sdk_for_andorid" {
  type        = bool
  description = "(optional) describe your variable"
  default     = false
}

variable "use_distancematrix" {
  type        = bool
  description = "(optional) describe your variable"
  default     = false
}

variable "use_places" {
  type        = bool
  description = "(optional) describe your variable"
  default     = false
}

variable "use_directions" {
  type        = bool
  description = "(optional) describe your variable"
  default     = false
}

variable "use_datastore" {
  type        = bool
  description = "(optional) describe your variable"
  default     = false
}



