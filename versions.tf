terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
    }
    hcloud = {
      source = "hetznercloud/hcloud"
    }
    sops = {
      source = "carlpett/sops"
    }
    oci = {
      source = "oracle/oci"
    }
  }
}
