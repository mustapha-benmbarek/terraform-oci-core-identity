/*Data loading...*/
locals {
  json-compartments = try(jsondecode(file(var.json-compartments)), [])
}

/*Data decoding...*/
locals {
  lst-compartments = try({ for obj in local.json-compartments.data : obj.comp-name => obj }, tomap({}))
}
