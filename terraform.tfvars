# oci provider config
tenancy_ocid           = "<tenancy-ocid>"
region                 = "<region>"
config_file_profile    = "<oci-session-config-name>"
default_compartment_id = "<default-compartment-id>"
AD                     = 0

# network config
internet_gateway_display_name = "Internet Gateway vcn-tor-bridges"
vcn_display_name              = "vcn-tor-bridges"
vcn_dns_label                 = "vcntorbridges"
vcn_cidr_block                = "10.0.0.0/16"
subnet_display_name           = "public-subnet-tor-bridges"
subnet_dns_label              = "subnet"
subnet_cidr_block             = "10.0.0.0/24"

dhcp_options_display_name = "Default DHCP Options for vcn-tor-bridges"

security_list_display_name                           = "Default Security List for vcn-tor-bridges"
security_list_egress_security_rules_destination      = "0.0.0.0/0"
security_list_egress_security_rules_destination_type = "CIDR_BLOCK"
security_list_egress_security_rules_protocol         = "all"
security_list_egress_security_rules_stateless        = false

security_list_ingress_security_rules_destination = "0.0.0.0/0"

ssh_key_path = "~/.ssh/<id_the_public_key>.pub"

image_operating_system         = "Canonical Ubuntu"
image_operating_system_version = "20.04"

instance_shape        = "VM.Standard.A1.Flex"
instance_display_name = "tor-bridge"
counter_offset        = 0