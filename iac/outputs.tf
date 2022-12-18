
output "droplet_ip_addresses" {
  description = "Droplet IP Address"
  value       = digitalocean_droplet.jotpad.ipv4_address
}
