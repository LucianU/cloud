## Networking
resource "oci_core_vcn" "main_vcn" {
  compartment_id = local.compartment_id
  cidr_block     = "10.0.0.0/16"
  display_name   = "main-vcn"
}

resource "oci_core_internet_gateway" "main_ig" {
  compartment_id = local.compartment_id
  vcn_id         = oci_core_vcn.main_vcn.id
  display_name   = "main-ig"
}

resource "oci_core_route_table" "main_rt" {
  compartment_id = local.compartment_id
  vcn_id         = oci_core_vcn.main_vcn.id
  display_name   = "main-rt"

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.main_ig.id
  }
}

resource "oci_core_subnet" "main_subnet" {
  compartment_id = local.compartment_id
  vcn_id         = oci_core_vcn.main_vcn.id
  cidr_block     = "10.0.1.0/24"
  display_name   = "main-subnet"
  route_table_id = oci_core_route_table.main_rt.id
  security_list_ids = [
    oci_core_security_list.ssh.id,
    oci_core_security_list.web.id
  ]
}

resource "oci_core_security_list" "ssh" {
  compartment_id = local.compartment_id
  vcn_id         = oci_core_vcn.main_vcn.id
  display_name   = "ssh"

  # Ingress rule for SSH
  ingress_security_rules {
    protocol = "6" # TCP
    source   = "0.0.0.0/0"
    tcp_options {
      min = 22
      max = 22
    }
  }
}

resource "oci_core_security_list" "web" {
  compartment_id = local.compartment_id
  vcn_id         = oci_core_vcn.main_vcn.id
  display_name   = "web"

  # Ingress rule for HTTP
  ingress_security_rules {
    protocol = "6" # TCP
    source   = "0.0.0.0/0"
    tcp_options {
      min = 80
      max = 80
    }
  }

  # Ingress rule for HTTPS
  ingress_security_rules {
    protocol = "6" # TCP
    source   = "0.0.0.0/0"
    tcp_options {
      min = 443
      max = 443
    }
  }

  # Allows connection to Let's Encrypt
  egress_security_rules {
    destination = "0.0.0.0/0"
    protocol    = "6" # TCP
    stateless   = false
    tcp_options {
      min = 443
      max = 443
    }
  }
}
