terraform {
  required_providers {
    hcloud = {
      source = "hetznercloud/hcloud"
    }
    sops = {
      source = "carlpett/sops"
    }
  }
}

