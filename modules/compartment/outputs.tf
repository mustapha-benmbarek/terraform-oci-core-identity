data "oci_identity_compartments" "all" {
  compartment_id = var.core-tenancy-id
  state          = "Active"
}

locals {
  compartments = {
    for compartment in data.oci_identity_compartments.all.compartments :
    compartment.name => compartment.id
  }
}

output "ids" {
  value = local.compartments
}
