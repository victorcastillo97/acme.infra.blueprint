
STACK_EKS_LB_CONTROLLER		= eks/lb-controller

tf-lb-controller.init:
	@make execute \
	COMMAND="cd terraform/stacks/dev/${STACK_EKS_LB_CONTROLLER} && \
		terraform init -reconfigure \
			-backend-config=bucket=$(S3_BUCKET_TFSTATE) \
			-backend-config=key=deployments/$(ENV)/${STACK_EKS_LB_CONTROLLER}/terraform.tfstate \
			-backend-config=region=$(REGION) \
			-backend-config=dynamodb_table=$(DYNAMO_DB_TF_LOCK) \
			-backend-config=encrypt=true"


tf-lb-controller.plan:
	@make execute \
	COMMAND="cd terraform/stacks/dev/${STACK_EKS_LB_CONTROLLER} && \
		terraform plan \
		-var=remote_state_bucket=$(S3_BUCKET_TFSTATE) \
		-var=remote_state_key_eks=deployments/$(ENV)/${STACK_EKS}/terraform.tfstate \
		-var=remote_state_key_network=deployments/$(ENV)/${STACK_NETWORK}/terraform.tfstate \
		-var=remote_state_region=$(REGION) \
	"


tf-lb-controller.apply:
	@make execute \
	COMMAND="cd terraform/stacks/dev/${STACK_EKS_LB_CONTROLLER} && \
		terraform apply \
		-var=remote_state_bucket=$(S3_BUCKET_TFSTATE) \
		-var=remote_state_key_eks=deployments/$(ENV)/${STACK_EKS}/terraform.tfstate \
		-var=remote_state_key_network=deployments/$(ENV)/${STACK_NETWORK}/terraform.tfstate \
		-var=remote_state_region=$(REGION) \
		--auto-approve \
	"


tf-lb-controller.destroy:
	@make execute \
	COMMAND="cd terraform/stacks/dev/${STACK_EKS_LB_CONTROLLER} && \
		terraform destroy \
		-var=remote_state_bucket=$(S3_BUCKET_TFSTATE) \
		-var=remote_state_key_eks=deployments/$(ENV)/${STACK_EKS}/terraform.tfstate \
		-var=remote_state_key_network=deployments/$(ENV)/${STACK_NETWORK}/terraform.tfstate \
		-var=remote_state_region=$(REGION) \
		--auto-approve \
	"
