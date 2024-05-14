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

