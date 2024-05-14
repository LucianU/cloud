## Compute
resource "oci_core_instance" "oci_main" {
  compartment_id      = local.compartment_id
  display_name        = "oci-main"
  availability_domain = "RjdJ:EU-FRANKFURT-1-AD-2"
  shape               = local.oci_free_shape

  shape_config {
    ocpus         = 1
    memory_in_gbs = 1
  }

  source_details {
    source_type = "image"
    source_id   = local.ubuntu_frankfurt_image_id
  }

  create_vnic_details {
    subnet_id        = oci_core_subnet.main_subnet.id
    assign_public_ip = true
    display_name     = "oci-main-vnic"
  }

  metadata = {
    ssh_authorized_keys = local.ssh_public_key
  }
}

output "oci_main_ip" {
  value = oci_core_instance.oci_main.public_ip
}

resource "oci_core_instance" "oci_snd" {
  compartment_id      = local.compartment_id
  display_name        = "oci-snd"
  availability_domain = "RjdJ:EU-FRANKFURT-1-AD-2"
  shape               = local.oci_free_shape

  shape_config {
    ocpus         = 1
    memory_in_gbs = 1
  }

  source_details {
    source_type = "image"
    source_id   = local.ubuntu_frankfurt_image_id
  }

  create_vnic_details {
    subnet_id        = oci_core_subnet.main_subnet.id
    assign_public_ip = true
    display_name     = "oci-snd-vnic"
  }

  metadata = {
    ssh_authorized_keys = local.ssh_public_key
  }
}

output "oci_snd_ip" {
  value = oci_core_instance.oci_snd.public_ip
}

resource "oci_core_instance" "oci_arm_main" {
  compartment_id      = local.compartment_id
  display_name        = "oci-arm-main"
  availability_domain = "RjdJ:EU-FRANKFURT-1-AD-3"
  shape               = local.oci_arm_free_shape

  shape_config {
    ocpus         = 4
    memory_in_gbs = 24
  }

  source_details {
    source_type             = "image"
    source_id               = local.ubuntu_arm_frankfurt_image_id
    boot_volume_size_in_gbs = "65"
  }

  create_vnic_details {
    subnet_id        = oci_core_subnet.main_subnet.id
    assign_public_ip = true
    display_name     = "oci-arm-main-vnic"
  }

  metadata = {
    ssh_authorized_keys = local.ssh_public_key
  }
}

output "oci_arm_main_ip" {
  value = oci_core_instance.oci_arm_main.public_ip
}
