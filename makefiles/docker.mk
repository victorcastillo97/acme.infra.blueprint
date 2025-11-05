

OS_TARGET ?= win

# ====== Ruta de credenciales en host ======
ifeq ($(OS_TARGET),linux)
  PATH_AWS_CREDENTIALS_HOST ?= $(HOME)/.aws
else
  PATH_AWS_CREDENTIALS_HOST ?= ${PATH_AWS_CREDENTIALS}
endif


DOCKER_COMMAND = docker run --rm -i \
	-v "$(CURDIR):/work" \
	-v "$(PATH_AWS_CREDENTIALS_HOST):/root/.aws:ro" \
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
	  
show:
	@ echo ${PATH_AWS_CREDENTIALS_HOST}
	@ ${DOCKER_COMMAND} \
	--entrypoint /bin/bash \
	$(IMAGE) \
	-c "aws configure list" 
	


execute:
	@ ${DOCKER_COMMAND} \
	--entrypoint /bin/bash \
	$(IMAGE) \
	-c "${COMMAND}" 
