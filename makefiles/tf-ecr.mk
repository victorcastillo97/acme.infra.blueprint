
STACK_ECR 		= ecr

TYPE_APP        = web
SERVICE_NAME    = identity
ECR_NAME		= ${OWNER}-${TYPE_APP}-${SERVICE_NAME}-${ENV}-2

tf-ecr.init:
	@make execute \
	COMMAND="cd terraform/stacks/dev/${STACK_ECR} && \
		terraform init -reconfigure \
			-backend-config=bucket=$(S3_BUCKET_TFSTATE) \
			-backend-config=key=deployments/$(ENV)/${STACK_ECR}/terraform.tfstate \
			-backend-config=region=$(REGION) \
			-backend-config=dynamodb_table=$(DYNAMO_DB_TF_LOCK) \
			-backend-config=encrypt=true"


tf-ecr.plan:
	@make execute \
	COMMAND="cd terraform/stacks/dev/${STACK_ECR} && \
		terraform plan \
		-var=ecr_name=$(ECR_NAME) \
		-var-file=vars/$(ENV).tfvars"


tf-ecr.apply:
	@make execute \
	COMMAND="cd terraform/stacks/dev/${STACK_ECR} && \
		terraform apply \
		-var=ecr_name=$(ECR_NAME) \
		-var-file=vars/$(ENV).tfvars \
		--auto-approve"


tf-ecr.destroy:
	@make execute \
	COMMAND="cd terraform/stacks/dev/${STACK_ECR} && \
		terraform destroy \
		-var=ecr_name=$(ECR_NAME) \
		-var-file=vars/$(ENV).tfvars \
		--auto-approve"


	