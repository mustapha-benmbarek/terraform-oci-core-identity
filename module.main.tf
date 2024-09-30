/*Identity Module | Compartment */
module "compartments" {
  source            = "./modules/compartment"
  core-tenancy-id   = var.data-tenancy-id
  core-compartments = local.lst-compartments
}
