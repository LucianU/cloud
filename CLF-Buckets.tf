resource "cloudflare_r2_bucket" "documente" {
  account_id = local.cloudflare_account_id
  name = "documente"
  location = "EEUR"
}

output "cloudflare_r2_bucket_documente_url" {
  value = "https://${local.cloudflare_account_id}.r2.cloudflarestorage.com/${cloudflare_r2_bucket.documente.name}"
}


resource "cloudflare_r2_bucket" "oak_and_reed_software_srl" {
  account_id = local.cloudflare_account_id
  name = "oak-and-reed-software-srl"
  location = "EEUR"
}

output "cloudflare_r2_bucket_oak_and_reed_software_srl_url" {
  value = "https://${local.cloudflare_account_id}.r2.cloudflarestorage.com/${cloudflare_r2_bucket.oak_and_reed_software_srl.name}"
}


resource "cloudflare_r2_bucket" "know_elbear_com" {
  account_id = local.cloudflare_account_id
  name = "know-elbear-com"
  location = "EEUR"
}

output "cloudflare_r2_bucket_know_elbear_com_url" {
  value = "https://${local.cloudflare_account_id}.r2.cloudflarestorage.com/${cloudflare_r2_bucket.know_elbear_com.name}"
}


resource "cloudflare_r2_bucket" "haskell_elbear_com" {
  account_id = local.cloudflare_account_id
  name = "haskell-elbear-com"
  location = "EEUR"
}

output "cloudflare_r2_bucket_haskell_elbear_com_url" {
  value = "https://${local.cloudflare_account_id}.r2.cloudflarestorage.com/${cloudflare_r2_bucket.haskell_elbear_com.name}"
}


resource "cloudflare_r2_bucket" "rust_elbear_com" {
  account_id = local.cloudflare_account_id
  name = "rust-elbear-com"
  location = "EEUR"
}

output "cloudflare_r2_bucket_rust_elbear_com_url" {
  value = "https://${local.cloudflare_account_id}.r2.cloudflarestorage.com/${cloudflare_r2_bucket.rust_elbear_com.name}"
}


resource "cloudflare_r2_bucket" "publish_elbear_com" {
  account_id = local.cloudflare_account_id
  name = "publish-elbear-com"
  location = "EEUR"
}

output "cloudflare_r2_bucket_publish_elbear_com_url" {
  value = "https://${local.cloudflare_account_id}.r2.cloudflarestorage.com/${cloudflare_r2_bucket.publish_elbear_com.name}"
}


locals {
  cloudflare_account_id = "9997ad20d4c639d7d9b6e7293936ee5b"
}

