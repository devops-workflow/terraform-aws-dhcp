/**
 * AWS DHCP Terraform Module
 * =====================
 *
 * Usage:
 * ------
 *
 *     module "dhcp" {
 *       source      = "../tf_dhcp"
 *
 *       add variables
 *     }
**/

resource "aws_vpc_dhcp_options" "dhcp_opts" {
  domain_name          = "${var.domain_name}"
  domain_name_servers  = ["${var.domain_controllers}"]

  tags = "${ merge(
    var.tags,
    map("Name", var.namespaced ?
      format("%s-%s-dhcp-opts", var.environment, var.name) :
      format("%s-dhcp-opts", var.name) ),
    map("Environment", var.environment),
    map("Terraform", "true") )}"
}

resource "aws_vpc_dhcp_options_association" "vpc_dhcp_options_association" {
  vpc_id           = "${var.vpc_id}"
  dhcp_options_id  = "${aws_vpc_dhcp_options.dhcp_opts.id}"
}
