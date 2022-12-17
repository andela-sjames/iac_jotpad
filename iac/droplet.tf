resource "digitalocean_droplet" "sj-blogapp" {
  image  = "ubuntu-20-04-x64"
  name   = "sj-blogapp"
  region = "fra1"
  size   = "s-1vcpu-1gb"

  ssh_keys = [
    data.digitalocean_ssh_key.sjdo_ssh_key.id
  ]

  provisioner "remote-exec" {
    inline = ["sudo apt update", "sudo apt install python3 -y", "echo Done!"]

    connection {
      host        = self.ipv4_address
      user        = "root"
      type        = "ssh"
      private_key = file(var.pvt_key)
      timeout     = "2m"
      agent       = "false"
    }
  }

  provisioner "local-exec" {

    command = <<EOF
      export ANSIBLE_CONFIG="${local.ansible_directory}/${var.ansible_config_path}"
      ansible-playbook --private-key ${var.pvt_key} ${local.ansible_directory}/${var.external_ansible_playbook_path} -u root -i '${self.ipv4_address},' -e 'pub_key=${var.pub_key}' --vault-password-file ${var.vault_file_pw}
EOF
  }

}
