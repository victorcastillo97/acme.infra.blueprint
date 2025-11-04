PATH_DOCKERFILE 	= ../Dockerfile
PATH_CONTEXT_DOCKER = ../

build.image:
	@ docker build  \
		-f ${PATH_DOCKERFILE} \
		-t ${IMAGE_PROJECT} \
		${PATH_CONTEXT_DOCKER}

