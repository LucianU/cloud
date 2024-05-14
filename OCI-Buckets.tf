## Object Storage
data "oci_objectstorage_namespace" "this" {
}

resource "oci_objectstorage_bucket" "documente" {
  namespace      = data.oci_objectstorage_namespace.this.namespace
  compartment_id = local.compartment_id
  name           = "documente"
  access_type    = "NoPublicAccess"

  storage_tier = "Standard"
  versioning   = "Disabled"
}

output "oci_bucket_documente_url" {
  value = "https://${data.oci_objectstorage_namespace.this.namespace}.compat.objectstorage.${local.region}.oraclecloud.com/${oci_objectstorage_bucket.documente.name}"
}

resource "oci_objectstorage_bucket" "oak_and_reed_software_srl" {
  namespace      = data.oci_objectstorage_namespace.this.namespace
  compartment_id = local.compartment_id
  name           = "oak-and-reed-software-srl"
  access_type    = "NoPublicAccess"

  storage_tier = "Standard"
  versioning   = "Disabled"
}

output "oci_bucket_oak_and_reed_software_srl_url" {
  value = "https://${data.oci_objectstorage_namespace.this.namespace}.compat.objectstorage.${local.region}.oraclecloud.com/${oci_objectstorage_bucket.oak_and_reed_software_srl.name}"
}

resource "oci_objectstorage_bucket" "know_elbear_com" {
  namespace      = data.oci_objectstorage_namespace.this.namespace
  compartment_id = local.compartment_id
  name           = "know-elbear-com"
  access_type    = "NoPublicAccess"

  storage_tier = "Standard"
  versioning   = "Disabled"
}

output "oci_bucket_know_elbear_com_url" {
  value = "https://${data.oci_objectstorage_namespace.this.namespace}.compat.objectstorage.${local.region}.oraclecloud.com/${oci_objectstorage_bucket.know_elbear_com.name}"
}

resource "oci_objectstorage_bucket" "haskell_elbear_com" {
  namespace      = data.oci_objectstorage_namespace.this.namespace
  compartment_id = local.compartment_id
  name           = "haskell-elbear-com"
  access_type    = "NoPublicAccess"

  storage_tier = "Standard"
  versioning   = "Disabled"
}

output "oci_bucket_haskell_elbear_com_url" {
  value = "https://${data.oci_objectstorage_namespace.this.namespace}.compat.objectstorage.${local.region}.oraclecloud.com/${oci_objectstorage_bucket.haskell_elbear_com.name}"
}

resource "oci_objectstorage_bucket" "rust_elbear_com" {
  namespace      = data.oci_objectstorage_namespace.this.namespace
  compartment_id = local.compartment_id
  name           = "rust-elbear-com"
  access_type    = "NoPublicAccess"

  storage_tier = "Standard"
  versioning   = "Disabled"
}

output "oci_bucket_rust_elbear_com_url" {
  value = "https://${data.oci_objectstorage_namespace.this.namespace}.compat.objectstorage.${local.region}.oraclecloud.com/${oci_objectstorage_bucket.rust_elbear_com.name}"
}

resource "oci_objectstorage_bucket" "publish_elbear_com" {
  namespace      = data.oci_objectstorage_namespace.this.namespace
  compartment_id = local.compartment_id
  name           = "publish-elbear-com"
  access_type    = "NoPublicAccess"

  storage_tier = "Standard"
  versioning   = "Disabled"
}

output "oci_bucket_publish_elbear_com_url" {
  value = "https://${data.oci_objectstorage_namespace.this.namespace}.compat.objectstorage.${local.region}.oraclecloud.com/${oci_objectstorage_bucket.publish_elbear_com.name}"
}
