locals {
  region                        = "eu-frankfurt-1"
  compartment_id                = "ocid1.tenancy.oc1..aaaaaaaamveqbo2ukrkxltgsnbqhpoyvqiatey3lbulkacv2govaqdrkmc7a"
  ubuntu_frankfurt_image_id     = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaauf4c5nxqz6x7yle4rj355zhpjd35bqrx3khoclgh22zhma42o6sq"
  ubuntu_arm_frankfurt_image_id = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaaeusqwc4fgp4c5ienodxnlvrkimp4rp4a6snpnkpudznmdlxt3wpq"
  oci_free_shape                = "VM.Standard.E2.1.Micro"
  oci_arm_free_shape            = "VM.Standard.A1.Flex"
  ssh_public_key                = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPI+dFnzXZ0xACwp1x9hMH0FFx4+WLj7ZiXW+j2z58sc lucian@Lucians-MacBook-Pro-2.local"
}

