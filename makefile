.ONESHELL:
.PHONY: init plan apply destroy
.EXPORT_ALL_VARIABLES:


help:
	@echo
	@echo "  init          Initialize the project"
	@echo "  plan          plan changes on prod"
	@echo "  apply         apply changes on prod"
	@echo "  help          print this message"
	@echo

TF_LOG=1

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
