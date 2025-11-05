

DOCKER_COMMAND = docker run --rm -it \
	-v "$(CURDIR):/work" \
	-v "$(PATH_AWS_CREDENTIALS):/root/.aws:ro" \
	-e AWS_DEFAULT_REGION="$(REGION)" \
	-e AWS_PROFILE="$(AWS_PROFILE)" \
	-e TF_VAR_owner=$(OWNER) \
	-e TF_VAR_env=$(ENV) \
	-e TF_VAR_region=$(REGION)

build: ## Build image for development: make build.image
	@docker build -t $(IMAGE) -f docker/Dockerfile.terraform .

shell:
	@ ${DOCKER_COMMAND} \
	--entrypoint /bin/bash \
	$(IMAGE)
	  
execute:
	@ ${DOCKER_COMMAND} \
	--entrypoint /bin/bash \
	$(IMAGE) \
	-c "${COMMAND}" 
