## Compute

## DNS
resource "digitalocean_domain" "elbear-com" {
  name = "elbear.com"
}

resource "digitalocean_record" "know_elbear_com" {
  domain = digitalocean_domain.elbear-com.name
  type   = "A"
  name   = "know"
  value  = hcloud_server.main.ipv4_address
  ttl    = 300
}

resource "digitalocean_record" "haskell_elbear_com" {
  domain = digitalocean_domain.elbear-com.name
  type   = "A"
  name   = "haskell"
  value  = hcloud_server.main.ipv4_address
  ttl    = 300
}

resource "digitalocean_record" "rust_elbear_com" {
  domain = digitalocean_domain.elbear-com.name
  type   = "A"
  name   = "rust"
  value  = hcloud_server.main.ipv4_address
  ttl    = 300
}

resource "digitalocean_record" "publish_elbear_com" {
  domain = digitalocean_domain.elbear-com.name
  type   = "A"
  name   = "publish"
  value  = hcloud_server.main.ipv4_address
  ttl    = 300
}

resource "digitalocean_record" "sim_elbear_com" {
  domain = digitalocean_domain.elbear-com.name
  type   = "A"
  name   = "sim"
  value  = hcloud_server.main.ipv4_address
  ttl    = 300
}


resource "digitalocean_record" "odoo_elbear_com" {
  domain = digitalocean_domain.elbear-com.name
  type   = "A"
  name   = "odoo"
  value  = oci_core_instance.oci_snd.public_ip
  ttl    = 300
}

resource "digitalocean_record" "know_staging_elbear_com" {
  domain = digitalocean_domain.elbear-com.name
  type   = "A"
  name   = "know.staging"
  value  = oci_core_instance.oci_main.public_ip
  ttl    = 300
}

resource "digitalocean_record" "haskell_staging_elbear_com" {
  domain = digitalocean_domain.elbear-com.name
  type   = "A"
  name   = "haskell.staging"
  value  = oci_core_instance.oci_main.public_ip
  ttl    = 300
}

resource "digitalocean_record" "rust_staging_elbear_com" {
  domain = digitalocean_domain.elbear-com.name
  type   = "A"
  name   = "rust.staging"
  value  = oci_core_instance.oci_main.public_ip
  ttl    = 300
}

resource "digitalocean_record" "publish_staging_elbear_com" {
  domain = digitalocean_domain.elbear-com.name
  type   = "A"
  name   = "publish.staging"
  value  = oci_core_instance.oci_main.public_ip
  ttl    = 300
}

resource "digitalocean_record" "sim_staging_elbear_com" {
  domain = digitalocean_domain.elbear-com.name
  type   = "A"
  name   = "sim.staging"
  value  = oci_core_instance.oci_main.public_ip
  ttl    = 300
}

## Object Storage
resource "digitalocean_spaces_bucket" "elb_raw_information_store" {
  name   = "elb-raw-information-store"
  region = "ams3"
}

resource "digitalocean_spaces_bucket" "knowledge_db_backups" {
  name   = "knowledge-db-backups"
  region = "fra1"
}

resource "digitalocean_spaces_bucket" "know_elbear_com" {
  name   = "know-elbear-com"
  region = "fra1"
}

resource "digitalocean_spaces_bucket" "haskell_elbear_com" {
  name   = "haskell-elbear-com"
  region = "fra1"
}

resource "digitalocean_spaces_bucket" "rust_elbear_com" {
  name   = "rust-elbear-com"
  region = "fra1"
}

resource "digitalocean_spaces_bucket" "publish_elbear_com" {
  name   = "publish-elbear-com"
  region = "fra1"
}

resource "digitalocean_spaces_bucket" "sim_elbear_com" {
  name   = "sim-elbear-com"
  region = "fra1"
}

resource "digitalocean_spaces_bucket" "stage_elbear_com" {
  name   = "stage-elbear-com"
  region = "fra1"
}

