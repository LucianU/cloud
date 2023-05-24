## Compute
resource "digitalocean_droplet" "do-nixos-stage" {
  name = "do-nixos-stage"
  size = "s-1vcpu-1gb"
  image = "130433697" # nixos-22.11
  region = "fra1"
  ssh_keys = [
    "c2:25:6b:13:01:f7:bd:e1:18:55:e8:9c:6e:39:e1:d5"
  ]
}

output "droplet_ip" {
  value = digitalocean_droplet.do-nixos-stage.ipv4_address
}

## DNS
resource "digitalocean_domain" "elbear-com" {
  name = "elbear.com"
}

resource "digitalocean_record" "know_staging_elbear_com" {
  domain = digitalocean_domain.elbear-com.name
  type = "A"
  name = "know.staging"
  value = digitalocean_droplet.do-nixos-stage.ipv4_address
  ttl = 300
}

resource "digitalocean_record" "haskell_staging_elbear_com" {
  domain = digitalocean_domain.elbear-com.name
  type = "A"
  name = "haskell.staging"
  value = digitalocean_droplet.do-nixos-stage.ipv4_address
  ttl = 300
}

resource "digitalocean_record" "rust_staging_elbear_com" {
  domain = digitalocean_domain.elbear-com.name
  type = "A"
  name = "rust.staging"
  value = digitalocean_droplet.do-nixos-stage.ipv4_address
  ttl = 300
}

resource "digitalocean_record" "publish_staging_elbear_com" {
  domain = digitalocean_domain.elbear-com.name
  type = "A"
  name = "publish.staging"
  value = digitalocean_droplet.do-nixos-stage.ipv4_address
  ttl = 300
}

resource "digitalocean_record" "sim_staging_elbear_com" {
  domain = digitalocean_domain.elbear-com.name
  type = "A"
  name = "sim.staging"
  value = digitalocean_droplet.do-nixos-stage.ipv4_address
  ttl = 300
}

resource "digitalocean_record" "know_elbear_com" {
  domain = digitalocean_domain.elbear-com.name
  type = "A"
  name = "know"
  value = hcloud_server.main.ipv4_address
  ttl = 300
}

resource "digitalocean_record" "haskell_elbear_com" {
  domain = digitalocean_domain.elbear-com.name
  type = "A"
  name = "haskell"
  value = hcloud_server.main.ipv4_address
  ttl = 300
}

resource "digitalocean_record" "rust_elbear_com" {
  domain = digitalocean_domain.elbear-com.name
  type = "A"
  name = "rust"
  value = hcloud_server.main.ipv4_address
  ttl = 300
}

resource "digitalocean_record" "publish_elbear_com" {
  domain = digitalocean_domain.elbear-com.name
  type = "A"
  name = "publish"
  value = hcloud_server.main.ipv4_address
  ttl = 300
}

resource "digitalocean_record" "sim_elbear_com" {
  domain = digitalocean_domain.elbear-com.name
  type = "A"
  name = "sim"
  value = hcloud_server.main.ipv4_address
  ttl = 300
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

