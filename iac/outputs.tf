
output "droplet_ip_addresses" {
  description = "Droplet IP Address"
  value       = digitalocean_droplet.sj-blogapp.ipv4_address
}
