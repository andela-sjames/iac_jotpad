.ONESHELL:
.PHONY: init plan apply destroy ansible-update
.EXPORT_ALL_VARIABLES:


help:
	@echo
	@echo "  init             Initialize the project"
	@echo "  plan             plan changes on prod"
	@echo "  apply            apply changes on prod"
	@echo "  help             print this message"
	@echo "  destroy          destroy created infrastructure"
	@echo "  ansible-update   Use ansible to update digital ocean droplet"
	@echo

TF_LOG=1
ANSIBLE_HOST_KEY_CHECKING=False
ANSIBLE_CONFIG="ansible.cfg"

init:
	cd iac && \
	terraform init

plan:
	cd iac && \
	terraform plan -var-file=prod.tfvars

apply:
	cd iac && \
	terraform apply -var-file=prod.tfvars

destroy:
	cd iac && \
	terraform destroy -var-file=prod.tfvars

ansible-update:
	cd ansible && \
	ansible-playbook --private-key "~/.ssh/id_rsa" playbooks/droplet_do.yml -u root -i inventory -e 'pub_key=~/.ssh/id_rsa.pub' --vault-password-file  ../iac/vault_pass.txt
