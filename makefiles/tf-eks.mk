
STACK_EKS		= eks/cluster
CLUSTER_NAME	= eks-${OWNER}-${ENV}-${REGION}

tf-eks.init:
	@make execute \
	COMMAND="cd terraform/stacks/dev/${STACK_EKS} && \
		terraform init -reconfigure \
			-backend-config=bucket=$(S3_BUCKET_TFSTATE) \
			-backend-config=key=deployments/$(ENV)/${STACK_EKS}/terraform.tfstate \
			-backend-config=region=$(REGION) \
			-backend-config=dynamodb_table=$(DYNAMO_DB_TF_LOCK) \
			-backend-config=encrypt=true"


tf-eks.plan:
	@make execute \
	COMMAND="cd terraform/stacks/dev/${STACK_EKS} && \
		terraform plan \
		-var=cluster_name=$(CLUSTER_NAME) \
		-var=remote_state_bucket=$(S3_BUCKET_TFSTATE) \
		-var=remote_state_key_network=deployments/$(ENV)/${STACK_NETWORK}/terraform.tfstate \
		-var=remote_state_region=$(REGION) \
	"
	
tf-eks.apply:
	@make execute \
	COMMAND="cd terraform/stacks/dev/${STACK_EKS} && \
		terraform apply \
		-var=cluster_name=$(CLUSTER_NAME) \
		-var=remote_state_bucket=$(S3_BUCKET_TFSTATE) \
		-var=remote_state_key_network=deployments/$(ENV)/${STACK_NETWORK}/terraform.tfstate \
		-var=remote_state_region=$(REGION) \
		--auto-approve \
	"

tf-eks.destroy:
	@make execute \
	COMMAND="cd terraform/stacks/dev/${STACK_EKS} && \
		terraform destroy \
		-var=cluster_name=$(CLUSTER_NAME) \
		-var=remote_state_bucket=$(S3_BUCKET_TFSTATE) \
		-var=remote_state_key_network=deployments/$(ENV)/${STACK_NETWORK}/terraform.tfstate \
		-var=remote_state_region=$(REGION) \
		--auto-approve \
	"


tf-eks:
	@make execute \
	COMMAND="cd terraform/stacks/dev/${STACK_EKS} && \
		terraform force-unlock -force 1c0d385e-0d68-4038-b1fe-bc8867dff631"
	

