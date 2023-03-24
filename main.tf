resource "hcloud_server" "main" {
  name   = "main"
  image  = "ubuntu-22.04"
  server_type = "cpx31"
  location = "nbg1"
}
