


tf.init:
	@make execute \
	COMMAND="cd terraform/stacks/dev/networking && \
		terraform init -reconfigure \
			-backend-config=bucket=$(S3_BUCKET_TFSTATE) \
			-backend-config=key=deployments/$(ENV)/terraform.tfstate \
			-backend-config=region=$(REGION) \
			-backend-config=dynamodb_table=$(DYNAMO_DB_TF_LOCK) \
			-backend-config=encrypt=true"


tf.plan:
	@make execute \
	COMMAND="cd terraform/stacks/dev/networking && \
		terraform plan -var-file=vars/$(ENV).tfvars"


tf.apply:
	@make execute \
	COMMAND="cd terraform/stacks/dev/networking && \
		terraform apply"

tf.destroy:
	@make execute \
	COMMAND="cd terraform/stacks/dev/networking && \
		terraform destroy"
