/*Identity Module | Compartment */
module "compartments" {
  source            = "./modules/compartment"
  core-tenancy-id   = var.TENANCY_OCID
  core-compartments = local.lst-compartments  
}
