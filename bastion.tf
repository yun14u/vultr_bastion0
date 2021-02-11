##################################################################################
#  Note: 
##################################################################################
# VARIABLES
##################################################################################
variable "vultr_api_key"   {}
variable "region"          {}
variable "startup_script"  {}


##################################################################################
# PROVIDERS
##################################################################################

provider "vultr" {
	 api_key = var.vultr_api_key
}

##################################################################################
# DATA
##################################################################################
#data "aws_vpc" "default" {
#   default = true
#}


##################################################################################
# RESOURCES
##################################################################################
resource "vultr_startup_script" "bastion" {
	name     = "startup"
	script   = base64encode( file(var.startup_script) )
}

resource "vultr_instance" "bastion" {
	 plan        = "vc2-1c-1gb"
	 region      = var.region
	 os_id       = 387
	 script_id   = vultr_startup_script.bastion.id
	 enable_ipv6      = false

}

resource "vultr_instance_ipv4" "bastion_ipv4" {
	 instance_id = vultr_instance.bastion.id
}

##################################################################################
# OUTPUT
##################################################################################
output "instance_main_ip" {
	 value = vultr_instance.bastion.main_ip
}
output "instance_defaultpassword" {
	 value = vultr_instance.bastion.default_password
}
