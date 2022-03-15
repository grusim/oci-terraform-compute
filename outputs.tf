output "instance_id" {
  description = "name of created instances. "
  value       = oci_core_instance.arm_instances.*.display_name
}

output "public_ip" {
  description = "Public IPs of created instances. "
  value       = oci_core_instance.arm_instances.*.public_ip
}