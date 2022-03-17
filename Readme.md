# Oracle Cloud compute instances with Terraform

With the provided Terraform scripts you can quickly spin up a desired number of compute instances (VMs) on the Oracle Cloud using the [oci Provider](https://registry.terraform.io/providers/hashicorp/oci).

The setup will also create a new Compartment and the needed Networking resources like VCN with default DHCP options, Subnet, Default Routing Table, Internet Gateway and Security list.

For your particular use case you might want to change the Security list in [`network.tf`](network.tf). Since we're using it in this example to bring up some Tor Bridges to circumvent censorship – as currently seen in Russia – the file holds the needed configuration for this.

:information_source: | After bringing up the instances with this Terraform scripts you can e.g. use the [Tor-OBFS4-Bridge-Ansible-Playbook](https://github.com/cyb3rwr3ck/Tor-OBFS4-Bridge-Ansible-Playbook) to configure and start the bridge(s).
:---: | :---


## Prerequisites

- Get the `oci-cli` [for your platform](https://docs.oracle.com/en-us/iaas/Content/API/SDKDocs/cliinstall.htm)
- Install the [Terraform CLI](https://www.terraform.io/downloads)


## Edit the [`terraform.tfvars`](terraform.tfvars) file

Replace at least all variable values in \<braces\>

- `tenancy_ocid`
- `region`
- `config_file_profile` is a session value inside the `~/.oci/config` file - we use this because this deployment won't take longer than 1 hour
- `default_compartment_id` - use the `tenancy_ocid` here again unless you want to have the generated department nested under an existing one besides your root compartment
- generate a new ssh key pair and provide the path to the public key as value to the `ssh_key_path` variable
- `number_of_instances` - the count of instances to provision
- (optional) you can provide a `counter_offset` to start creating your instances with higher number display names

:exclamation: | You might need to change the `AD` variable if you're using the Oracle free tier. To find out which one of the usually three availability domains is the one that says "Always Free Eligible" just click on "Create a VM instance" in the Oracle Cloud Console and have a look under "Placement". If it says "AD 1" there for example, the AD variable has to be set to "0" - yes programmers are weird that way ;-)
:---: | :---

Change additional variables to your liking.

## Authenticate with Oracle CLI

`oci session authenticate`

This will open a Web Browser to sign in and get the session.

Save the session profile to your config file by providing a `<oci-session-config-name>` at the end of the authentication flow and set this profile name in the `terraform.tfvars` file.

## Run the Terraform scripts

- `terraform init`
- `terraform plan` - to see whether you put the correct variables
- `terraform apply` - to provision all resources and compute instances
- `terraform destroy` - to get rid of all the resources again
