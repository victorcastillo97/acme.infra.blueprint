
envs:
	$(eval AWS_ACCOUNT_ID = $(shell aws sts get-caller-identity --query "Account" --output text --profile ${AWS_PROFILE}))
	$(eval PATH_ECR = ${AWS_ACCOUNT_ID}.dkr.ecr.${REGION}.amazonaws.com)

ecr.create: envs ## Crea el repositorio ECR
	aws ecr create-repository \
		--repository-name ${PROJECT_NAME} \
		--region ${REGION} \
		--profile ${AWS_PROFILE}


ecr.delete: envs ## Elimina el repositorio ECR (incluyendo imágenes). Uso: make ecr.delete IMAGE=repo:tag
	aws ecr delete-repository \
		--repository-name ${PROJECT_NAME}  \
		--force \
		--region ${REGION} \
		--profile ${AWS_PROFILE}

ecr.login: envs ## Login for the repository ECR in AWS.: make ecr.login
	@aws ecr get-login-password --region ${REGION} --profile ${AWS_PROFILE} | \
	docker login --username AWS --password-stdin \
	${PATH_ECR}

ecr.login.linux: envs ## Login for the repository ECR in AWS.: make ecr.login
	@aws ecr get-login-password --region ${REGION} | \
	docker login --username AWS --password-stdin \
	${PATH_ECR}

ecr.tag.image: envs ## Tag of image dockerized for the repository ECR.: make ecr.tag.image
	@docker tag ${IMAGE} ${PATH_ECR}/${IMAGE}

ecr.push: envs ## Allows to upload dockerized image to repository ECR.: make ecr.push
	@docker push ${PATH_ECR}/${IMAGE}

ecr.push.app: ## Create the ECR repository and host the image there for app.: make ecr.push.app
	@ make ecr.tag.image IMAGE=${IMAGE_PROJECT}
	@ make ecr.push IMAGE=${IMAGE_PROJECT}

