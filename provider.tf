provider "oci" {
  config_file_profile = "DEFAULT" # the config is in ~/.oci/config
}

provider "cloudflare" {
  email = data.sops_file.secrets.data["cloudflare_email"]
  api_key = data.sops_file.secrets.data["cloudflare_api_key"]
}

provider "hcloud" {
  token = data.sops_file.secrets.data["hetzner_api_token"]
}

provider "digitalocean" {
  token             = data.sops_file.secrets.data["digitalocean_api_token"]
  spaces_access_id  = data.sops_file.secrets.data["digitalocean_spaces_access_id"]
  spaces_secret_key = data.sops_file.secrets.data["digitalocean_spaces_secret_key"]
}

provider "sops" {}

data "sops_file" "secrets" {
  source_file = "secrets.yaml"
}

