locals {
  region = "eu-frankfurt-1"
  compartment_id = "ocid1.tenancy.oc1..aaaaaaaamveqbo2ukrkxltgsnbqhpoyvqiatey3lbulkacv2govaqdrkmc7a"
  ubuntu_frankfurt_image_id = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaauf4c5nxqz6x7yle4rj355zhpjd35bqrx3khoclgh22zhma42o6sq"
  ubuntu_arm_frankfurt_image_id = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaaeusqwc4fgp4c5ienodxnlvrkimp4rp4a6snpnkpudznmdlxt3wpq"
  oci_free_shape = "VM.Standard.E2.1.Micro"
  oci_arm_free_shape = "VM.Standard.A1.Flex"
  ssh_public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPI+dFnzXZ0xACwp1x9hMH0FFx4+WLj7ZiXW+j2z58sc lucian@Lucians-MacBook-Pro-2.local"
}

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
  vcn_id = oci_core_vcn.main_vcn.id
  display_name = "ssh"

  # Ingress rule for SSH
  ingress_security_rules {
    protocol = "6" # TCP
    source = "0.0.0.0/0"
    tcp_options {
      min = 22
      max = 22
    }
  }
}

resource "oci_core_security_list" "web" {
  compartment_id = local.compartment_id
  vcn_id = oci_core_vcn.main_vcn.id
  display_name = "web"

  # Ingress rule for HTTP
  ingress_security_rules {
    protocol = "6" # TCP
    source = "0.0.0.0/0"
    tcp_options {
      min = 80
      max = 80
    }
  }

  # Ingress rule for HTTPS
  ingress_security_rules {
    protocol = "6" # TCP
    source = "0.0.0.0/0"
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

## Compute
resource "oci_core_instance" "oci_main" {
  compartment_id = local.compartment_id
  display_name   = "oci-main"
  availability_domain = "RjdJ:EU-FRANKFURT-1-AD-2"
  shape          = local.oci_free_shape

  shape_config {
    ocpus = 1
    memory_in_gbs = 1
  }

  source_details {
    source_type = "image"
    source_id   = local.ubuntu_frankfurt_image_id
  }

  create_vnic_details {
    subnet_id = oci_core_subnet.main_subnet.id
    assign_public_ip = true
    display_name = "oci-main-vnic"
  }

  metadata = {
    ssh_authorized_keys = local.ssh_public_key
  }
}

output "oci_main_ip" {
  value = oci_core_instance.oci_main.public_ip
}

resource "oci_core_instance" "oci_snd" {
  compartment_id = local.compartment_id
  display_name   = "oci-snd"
  availability_domain = "RjdJ:EU-FRANKFURT-1-AD-2"
  shape          = local.oci_free_shape

  shape_config {
    ocpus = 1
    memory_in_gbs = 1
  }

  source_details {
    source_type = "image"
    source_id   = local.ubuntu_frankfurt_image_id
  }

  create_vnic_details {
    subnet_id = oci_core_subnet.main_subnet.id
    assign_public_ip = true
    display_name = "oci-snd-vnic"
  }

  metadata = {
    ssh_authorized_keys = local.ssh_public_key
  }
}

output "oci_snd_ip" {
  value = oci_core_instance.oci_snd.public_ip
}

resource "oci_core_instance" "oci_arm_main" {
  compartment_id = local.compartment_id
  display_name   = "oci-arm-main"
  availability_domain = "RjdJ:EU-FRANKFURT-1-AD-3"
  shape          = local.oci_arm_free_shape

  shape_config {
    ocpus = 4
    memory_in_gbs = 24
  }

  source_details {
    source_type = "image"
    source_id   = local.ubuntu_arm_frankfurt_image_id
    boot_volume_size_in_gbs = "65"
  }

  create_vnic_details {
    subnet_id = oci_core_subnet.main_subnet.id
    assign_public_ip = true
    display_name = "oci-arm-main-vnic"
  }

  metadata = {
    ssh_authorized_keys = local.ssh_public_key
  }
}

output "oci_arm_main_ip" {
  value = oci_core_instance.oci_arm_main.public_ip
}

## Object Storage
data "oci_objectstorage_namespace" "this" {
}

resource "oci_objectstorage_bucket" "documente" {
  namespace        = data.oci_objectstorage_namespace.this.namespace
  compartment_id   = local.compartment_id
  name             = "documente"
  access_type      = "NoPublicAccess"

  storage_tier     = "Standard"
  versioning       = "Disabled"
}

output "oci_bucket_documente_url" {
  value = "https://${data.oci_objectstorage_namespace.this.namespace}.compat.objectstorage.${local.region}.oraclecloud.com/${oci_objectstorage_bucket.documente.name}"
}

resource "oci_objectstorage_bucket" "oak_and_reed_software_srl" {
  namespace        = data.oci_objectstorage_namespace.this.namespace
  compartment_id   = local.compartment_id
  name             = "oak-and-reed-software-srl"
  access_type      = "NoPublicAccess"

  storage_tier     = "Standard"
  versioning       = "Disabled"
}

output "oci_bucket_oak_and_reed_software_srl_url" {
  value = "https://${data.oci_objectstorage_namespace.this.namespace}.compat.objectstorage.${local.region}.oraclecloud.com/${oci_objectstorage_bucket.oak_and_reed_software_srl.name}"
}

resource "oci_objectstorage_bucket" "know_elbear_com" {
  namespace = data.oci_objectstorage_namespace.this.namespace
  compartment_id = local.compartment_id
  name = "know-elbear-com"
  access_type = "NoPublicAccess"

  storage_tier = "Standard"
  versioning = "Disabled"
}

output "oci_bucket_know_elbear_com_url" {
  value = "https://${data.oci_objectstorage_namespace.this.namespace}.compat.objectstorage.${local.region}.oraclecloud.com/${oci_objectstorage_bucket.know_elbear_com.name}"
}

resource "oci_objectstorage_bucket" "haskell_elbear_com" {
  namespace = data.oci_objectstorage_namespace.this.namespace
  compartment_id = local.compartment_id
  name = "haskell-elbear-com"
  access_type = "NoPublicAccess"

  storage_tier = "Standard"
  versioning = "Disabled"
}

output "oci_bucket_haskell_elbear_com_url" {
  value = "https://${data.oci_objectstorage_namespace.this.namespace}.compat.objectstorage.${local.region}.oraclecloud.com/${oci_objectstorage_bucket.haskell_elbear_com.name}"
}

resource "oci_objectstorage_bucket" "rust_elbear_com" {
  namespace = data.oci_objectstorage_namespace.this.namespace
  compartment_id = local.compartment_id
  name = "rust-elbear-com"
  access_type = "NoPublicAccess"

  storage_tier = "Standard"
  versioning = "Disabled"
}

output "oci_bucket_rust_elbear_com_url" {
  value = "https://${data.oci_objectstorage_namespace.this.namespace}.compat.objectstorage.${local.region}.oraclecloud.com/${oci_objectstorage_bucket.rust_elbear_com.name}"
}

resource "oci_objectstorage_bucket" "publish_elbear_com" {
  namespace = data.oci_objectstorage_namespace.this.namespace
  compartment_id = local.compartment_id
  name = "publish-elbear-com"
  access_type = "NoPublicAccess"

  storage_tier = "Standard"
  versioning = "Disabled"
}

output "oci_bucket_publish_elbear_com_url" {
  value = "https://${data.oci_objectstorage_namespace.this.namespace}.compat.objectstorage.${local.region}.oraclecloud.com/${oci_objectstorage_bucket.publish_elbear_com.name}"
}
