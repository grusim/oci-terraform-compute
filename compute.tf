resource "oci_core_instance" "arm_instances" {
  count = 6
  agent_config {
    is_management_disabled = "false"
    is_monitoring_disabled = "false"
    plugins_config {
      desired_state = "DISABLED"
      name          = "Vulnerability Scanning"
    }
    plugins_config {
      desired_state = "ENABLED"
      name          = "Compute Instance Monitoring"
    }
    plugins_config {
      desired_state = "DISABLED"
      name          = "Bastion"
    }
  }
  availability_config {
    recovery_action = "RESTORE_INSTANCE"
  }
  availability_domain = data.oci_identity_availability_domains.ADs.availability_domains[var.AD]["name"]
  compartment_id      = oci_identity_compartment.tor_bridges_compartment.id
  create_vnic_details {
    assign_private_dns_record = "true"
    assign_public_ip          = "true"
    subnet_id                 = oci_core_subnet.the_subnet.id
  }
  display_name = "${var.instance_display_name}-${count.index + 1 + var.counter_offset}"
  instance_options {
    are_legacy_imds_endpoints_disabled = "false"
  }
  is_pv_encryption_in_transit_enabled = "true"
  metadata = {
    "ssh_authorized_keys" = file(var.ssh_key_path)
  }
  shape = var.instance_shape
  shape_config {
    memory_in_gbs = "6"
    ocpus         = "1"
  }
  source_details {
    source_type = "image"
    source_id   = lookup(data.oci_core_images.compute_images.images[0], "id")
  }
}
