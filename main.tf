resource "hcloud_server" "main" {
  name   = "main"
  image  = "ubuntu-22.04"
  server_type = "cpx31"
  location = "nbg1"
}

resource "digitalocean_droplet" "do-nixos-stage" {
  name = "do-nixos-stage"
  size = "s-1vcpu-1gb"
  image = "130433697" # nixos-22.11
  region = "fra1"
  ssh_keys = [
    "c2:25:6b:13:01:f7:bd:e1:18:55:e8:9c:6e:39:e1:d5"
  ]
}

resource "digitalocean_domain" "elbear-com" {
  name = "elbear.com"
}

resource "digitalocean_record" "know-staging-elbear-com" {
  domain = digitalocean_domain.elbear-com.name
  type = "A"
  name = "know.staging.elbear.com"
  value = digitalocean_droplet.do-nixos-stage.ipv4_address
  ttl = 300
}

output "droplet_ip" {
  value = digitalocean_droplet.do-nixos-stage.ipv4_address
}

