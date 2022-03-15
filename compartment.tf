resource "oci_identity_compartment" "tor_bridges_compartment" {
  compartment_id = var.default_compartment_id
  description    = "Compartment for Tor Bridges managed by Terraform"
  name           = "TorBridges"
}