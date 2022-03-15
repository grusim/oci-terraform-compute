provider "oci" {
  auth                = "SecurityToken"
  config_file_profile = "oci-session-config"
  region              = var.region
}