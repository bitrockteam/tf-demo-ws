UNAME:=$(shell uname)
TERRAFORM_VERSION="0.12.25"
TF_VERSION=`terraform -v | head -1 | awk -F "v" '{print $2}'`
TERRAFORM:= $(shell command -v terraform 2> /dev/null)

default:

	@echo "Creates a TF system from a template."
	@echo "The following commands are available:"
	@echo " -init 		: runs TF init for an environment"
	@echo " -plan 		: runs TF plan for an environment"
	@echo " -apply		: runs TF apply for an environment"
	@echo " -destroy	: will delete the entire project's infrastructure"

check-init: check
	@echo ""
	ifndef TERRAFORM 
		$(error "terraform is not available please install it before continue")
	endif 
	@if [ "$(value ENV)" != "workspaces" ]; then echo "Please define ENV=workspaces to initialize TF"; exit 1; fi

check:
	@echo ""
	@echo "checking TF version... expecting [${TERRAFORM_VERSION}, found ${TF_VERSION}]"
 
init: check-init
	@echo ""
	@echo "Starting the creation of workspaces defined"
	@echo ""
	@read -p "Press enter to continue"

	@echo "Initializing the s3 backend..."
	@terraform init -backend=true -backend-config="profile=victor-test" -force-copy

	@echo "Creating the backend workspaces..."
	@terraform workspace new development
	@terraform workspace new testing
	@terraform workspace new production

	@echo "Backends initialized"

plan: check
	@terraform fmt \
		-write=true \
		-recursive

	@echo "Terraform download the required modules in your project .terraform folder"
	@terraform get

	@echo "Switch to the [$(value ENV)] environment."
	@terraform workspace select $(value ENV)

	@terraform plan \
		-var-file="env_vars/$(value ENV).tfvars" \
		-out $(value ENV).plan

apply: check
	@echo "Swtiching to the [$(value ENV)] environment ..."
	@terraform workspace select $(value ENV)

	@echo "Will be applying the following to [$(value ENV)] environment:"
	@terraform show -no-color $(value ENV).plan

	@terraform apply $(value ENV).plan
	@rm $(value ENV).plan

destroy: check
	@echo "Switching to the [$(value ENV)] environment ..."
	@terraform workspace select $(value ENV)
	@echo "Are you really sure you want to completely destroy [$(value ENV)] environment ?"
	@read -p "Press enter to continue"

	@terraform destroy \
		-var-file="env_vars/$(value ENV).tfvars" 

