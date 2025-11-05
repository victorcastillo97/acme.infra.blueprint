
STACK_NETWORK 	= network/vpc

tf-network.init:
	@make execute \
	COMMAND="cd terraform/stacks/dev/${STACK_NETWORK} && \
		terraform init -reconfigure \
			-backend-config=bucket=$(S3_BUCKET_TFSTATE) \
			-backend-config=key=deployments/$(ENV)/${STACK_NETWORK}/terraform.tfstate \
			-backend-config=region=$(REGION) \
			-backend-config=dynamodb_table=$(DYNAMO_DB_TF_LOCK) \
			-backend-config=encrypt=true"


tf-network.plan:
	@make execute \
	COMMAND="cd terraform/stacks/dev/${STACK_NETWORK} && \
		terraform plan \
		-var=cluster_name=$(CLUSTER_NAME) \
		-var-file=vars/$(ENV).tfvars"


tf-network.apply:
	@make execute \
	COMMAND="cd terraform/stacks/dev/${STACK_NETWORK} && \
		terraform apply \
		-var=cluster_name=$(CLUSTER_NAME) \
		-var-file=vars/$(ENV).tfvars \
		--auto-approve"


tf-network.destroy:
	@make execute \
	COMMAND="cd terraform/stacks/dev/${STACK_NETWORK} && \
		terraform destroy \
		-var=cluster_name=$(CLUSTER_NAME) \
		-var-file=vars/$(ENV).tfvars \
		--auto-approve"


	