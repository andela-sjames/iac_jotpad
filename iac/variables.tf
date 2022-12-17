variable "do_token" {}

variable "pvt_key" {}

variable "pub_key" {}

# ansible stuff
locals {
  ansible_dir       = "../ansible"
  ansible_directory = var.ansible_dir == "" ? local.ansible_dir : var.ansible_dir
}

variable "ansible_dir" {
  default = ""
}

variable "vault_file_pw" {
  default = "vault_pass.txt"
}

variable "external_ansible_playbook_path" {
  default = "playbooks/droplet_do.yml"
}

variable "ansible_config_path" {
  description = "Relative path to the ansible configurations, in the ansible_dir"
  default = "ansible.cfg"
}