/*Resource creation: Compartment [Level 1]*/
resource "oci_identity_compartment" "this_level_1" {
  for_each       = { for k, v in var.core-compartments : k => v if v.comp-level == 1 ? true : false }
  compartment_id = var.core-tenancy-id
  name           = each.value.comp-name
  description    = each.value.comp-description
  enable_delete  = true
}

/*Resource creation: Compartment [Level 2]*/
resource "oci_identity_compartment" "this_level_2" {
  for_each       = { for k, v in var.core-compartments : k => v if v.comp-level == 2 ? true : false }
  compartment_id = oci_identity_compartment.this_level_1[each.value.comp-parent-name].id
  name           = each.value.comp-name
  description    = each.value.comp-description
  enable_delete  = true
}

/*Resource creation: Compartment [Level 3]*/
resource "oci_identity_compartment" "this_level_3" {
  for_each       = { for k, v in var.core-compartments : k => v if v.comp-level == 3 ? true : false }
  compartment_id = oci_identity_compartment.this_level_2[each.value.comp-parent-name].id
  name           = each.value.comp-name
  description    = each.value.comp-description
  enable_delete  = true
}

/*Resource creation: Compartment [Level 4]*/
resource "oci_identity_compartment" "this_level_4" {
  for_each       = { for k, v in var.core-compartments : k => v if v.comp-level == 4 ? true : false }
  compartment_id = oci_identity_compartment.this_level_3[each.value.comp-parent-name].id
  name           = each.value.comp-name
  description    = each.value.comp-description
  enable_delete  = true
}

/*Resource creation: Compartment [Level 5]*/
resource "oci_identity_compartment" "this_level_5" {
  for_each       = { for k, v in var.core-compartments : k => v if v.comp-level == 5 ? true : false }
  compartment_id = oci_identity_compartment.this_level_4[each.value.comp-parent-name].id
  name           = each.value.comp-name
  description    = each.value.comp-description
  enable_delete  = true
}

/*Resource creation: Compartment [Level 6]*/
resource "oci_identity_compartment" "this_level_6" {
  for_each       = { for k, v in var.core-compartments : k => v if v.comp-level == 6 ? true : false }
  compartment_id = oci_identity_compartment.this_level_5[each.value.comp-parent-name].id
  name           = each.value.comp-name
  description    = each.value.comp-description
  enable_delete  = true
}
