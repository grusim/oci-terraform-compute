# oci provider config
variable "tenancy_ocid" {}
variable "region" {}
variable "config_file_profile" {}
variable "default_compartment_id" {}

variable "AD" {}

# network config
variable "internet_gateway_display_name" {}
variable "vcn_display_name" {}
variable "vcn_dns_label" {}
variable "vcn_cidr_block" {}
variable "subnet_display_name" {}
variable "subnet_dns_label" {}
variable "subnet_cidr_block" {}

variable "dhcp_options_display_name" {}

variable "security_list_display_name" {}
variable "security_list_egress_security_rules_destination" {}
variable "security_list_egress_security_rules_destination_type" {}
variable "security_list_egress_security_rules_protocol" {}
variable "security_list_egress_security_rules_stateless" {}

variable "security_list_ingress_security_rules_destination" {}

# machine configs
variable "ssh_key_path" {}
variable "image_operating_system" {}
variable "image_operating_system_version" {}

# instance name
variable "instance_shape" {}
variable "instance_display_name" {}
variable "counter_offset" {}
