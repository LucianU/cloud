## DNS
resource "cloudflare_zone" "elbear_com" {
  account_id = local.cloudflare_account_id
  zone = "elbear.com"
}


## Subdomains
## PROD
resource "cloudflare_record" "know_elbear_com" {
  zone_id   = cloudflare_zone.elbear_com.id
  type   = "A"
  name   = "know"
  value  = oci_core_instance.oci_snd.public_ip
  ttl    = 300
}

resource "cloudflare_record" "haskell_elbear_com" {
  zone_id   = cloudflare_zone.elbear_com.id
  type   = "A"
  name   = "haskell"
  value  = oci_core_instance.oci_snd.public_ip
  ttl    = 300
}

resource "cloudflare_record" "rust_elbear_com" {
  zone_id   = cloudflare_zone.elbear_com.id
  type   = "A"
  name   = "rust"
  value  = oci_core_instance.oci_snd.public_ip
  ttl    = 300
}

resource "cloudflare_record" "publish_elbear_com" {
  zone_id   = cloudflare_zone.elbear_com.id
  type   = "A"
  name   = "publish"
  value  = oci_core_instance.oci_snd.public_ip
  ttl    = 300
}

## STAGING
resource "cloudflare_record" "know_staging_elbear_com" {
  zone_id   = cloudflare_zone.elbear_com.id
  type   = "A"
  name   = "know.staging"
  value  = oci_core_instance.oci_main.public_ip
  ttl    = 300
}

resource "cloudflare_record" "haskell_staging_elbear_com" {
  zone_id   = cloudflare_zone.elbear_com.id
  type   = "A"
  name   = "haskell.staging"
  value  = oci_core_instance.oci_main.public_ip
  ttl    = 300
}

resource "cloudflare_record" "rust_staging_elbear_com" {
  zone_id   = cloudflare_zone.elbear_com.id
  type   = "A"
  name   = "rust.staging"
  value  = oci_core_instance.oci_main.public_ip
  ttl    = 300
}

resource "cloudflare_record" "publish_staging_elbear_com" {
  zone_id   = cloudflare_zone.elbear_com.id
  type   = "A"
  name   = "publish.staging"
  value  = oci_core_instance.oci_main.public_ip
  ttl    = 300
}

## Mail
resource "cloudflare_record" "mx01-icloud" {
  zone_id   = cloudflare_zone.elbear_com.id
  type     = "MX"
  name     = "@"
  priority = 10
  value    = "mx01.mail.icloud.com."
  ttl      = 14400
}

resource "cloudflare_record" "mx02-icloud" {
  zone_id   = cloudflare_zone.elbear_com.id
  type     = "MX"
  name     = "@"
  priority = 10
  value    = "mx02.mail.icloud.com."
  ttl      = 14400
}

resource "cloudflare_record" "apple-domain" {
  zone_id   = cloudflare_zone.elbear_com.id
  type   = "TXT"
  name   = "@"
  value  = "apple-domain=1cLlJuqH09gUDHAE"
  ttl    = 3600
}

resource "cloudflare_record" "spf1" {
  zone_id   = cloudflare_zone.elbear_com.id
  type   = "TXT"
  name   = "@"
  value  = "v=spf1 include:icloud.com ~all"
  ttl    = 3600
}

resource "cloudflare_record" "sig1" {
  zone_id   = cloudflare_zone.elbear_com.id
  type   = "CNAME"
  name   = "sig1._domainkey.elbear.com"
  value  = "sig1.dkim.elbear.com.at.icloudmailadmin.com."
  ttl    = 43200
}
