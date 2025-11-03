
# bootstrap
S3_BUCKET_TFSTATE  	= tfstate-$(OWNER)-$(REGION)
DYNAMO_DB_TF_LOCK  	= tf-locks-$(OWNER)
TF_KMS_ALIAS    	= alias/tfstate-$(OWNER)-3


tf.backend.init:
	@make execute \
	COMMAND="cd terraform/backend && \
		terraform init


tf.backend.plan:
	@make execute \
	COMMAND="cd terraform/backend && \
		terraform plan -var=aws_region=$(REGION) \
			-var=s3_bucket_name=$(S3_BUCKET_TFSTATE) \
			-var=dynamodb_table_name=$(DYNAMO_DB_TF_LOCK) \
			-var="kms_alias=$(TF_KMS_ALIAS)" 


tf.backend.apply:
	@make execute \
	COMMAND="cd terraform/backend && \
		terraform apply -var=aws_region=$(REGION) \
			-var=s3_bucket_name=$(S3_BUCKET_TFSTATE) \
			-var=dynamodb_table_name=$(DYNAMO_DB_TF_LOCK) \
			-var="kms_alias=$(TF_KMS_ALIAS)" \
			-auto-approve"


tf.backend.destroy:
	@make execute \
	COMMAND="cd terraform/backend && \
		terraform destroy -var=aws_region=$(REGION) \
			-var=s3_bucket_name=$(S3_BUCKET_TFSTATE) \
			-var=dynamodb_table_name=$(DYNAMO_DB_TF_LOCK) \
			-var="kms_alias=$(TF_KMS_ALIAS)" \
			-auto-approve && \
		rm -rf .terraform* && \
		rm -rf terraform.tfstate*"
	

