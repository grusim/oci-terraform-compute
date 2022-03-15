data "oci_identity_availability_domains" "ADs" {
  compartment_id = var.default_compartment_id
}
data "oci_core_images" "compute_images" {
  compartment_id           = var.default_compartment_id
  operating_system         = var.image_operating_system
  operating_system_version = var.image_operating_system_version
  shape                    = var.instance_shape
  sort_by                  = "TIMECREATED"
  sort_order               = "DESC"
}