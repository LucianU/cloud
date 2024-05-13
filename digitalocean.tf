## Compute

## DNS
resource "digitalocean_domain" "elbear-com" {
  name = "elbear.com"
}


## Subdomains
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

## Mail
resource "digitalocean_record" "mx01-icloud" {
  domain   = digitalocean_domain.elbear-com.name
  type     = "MX"
  name     = "@"
  priority = 10
  value    = "mx01.mail.icloud.com."
  ttl      = 14400
}

resource "digitalocean_record" "mx02-icloud" {
  domain   = digitalocean_domain.elbear-com.name
  type     = "MX"
  name     = "@"
  priority = 10
  value    = "mx02.mail.icloud.com."
  ttl      = 14400
}

resource "digitalocean_record" "apple-domain" {
  domain = digitalocean_domain.elbear-com.name
  type   = "TXT"
  name   = "@"
  value  = "apple-domain=1cLlJuqH09gUDHAE"
  ttl    = 3600
}

resource "digitalocean_record" "spf1" {
  domain = digitalocean_domain.elbear-com.name
  type   = "TXT"
  name   = "@"
  value  = "v=spf1 include:icloud.com ~all"
  ttl    = 3600
}

resource "digitalocean_record" "sig1" {
  domain = digitalocean_domain.elbear-com.name
  type   = "CNAME"
  name   = "sig1._domainkey.elbear.com"
  value  = "sig1.dkim.elbear.com.at.icloudmailadmin.com."
  ttl    = 43200
}


## Object Storage
resource "digitalocean_spaces_bucket" "elb_raw_information_store" {
  name   = "elb-raw-information-store"
  region = "ams3"
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

resource "digitalocean_spaces_bucket" "stage_elbear_com" {
  name   = "stage-elbear-com"
  region = "fra1"
}

