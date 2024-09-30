variable "core-compartments" {
  type = map(object({
    region-id        = optional(string)
    comp-level       = number
    comp-parent-name = optional(string, "")
    comp-name        = string
    comp-description = optional(string)
  }))
}

variable "core-tenancy-id" {
  type = string
}
