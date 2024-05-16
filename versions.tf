terraform {
  required_providers {
    oci = {
      source = "oracle/oci"
    }
    cloudflare = {
      source = "cloudflare/cloudflare"
    }
    digitalocean = {
      source = "digitalocean/digitalocean"
    }
    hcloud = {
      source = "hetznercloud/hcloud"
    }
    sops = {
      source = "carlpett/sops"
    }
  }
}
