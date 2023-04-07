provider "sops" { }

data "sops_file" "secrets" {
  source_file = "secrets.yaml"
}

provider "hcloud" {
  token = data.sops_file.secrets.data["hetzner_api_token"]
}

provider "digitalocean" {
  token = data.sops_file.secrets.data["digitalocean_api_token"]
}
