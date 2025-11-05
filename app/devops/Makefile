.DEFAULT_GOAL := help

include makefiles/ct.mk
include makefiles/ecr.mk

OWNER          	= acme
TYPE_APP        = web
SERVICE_NAME    = identity
ENV             = dev
REGION			= us-east-2
AWS_PROFILE		= entrepenur

PROJECT_NAME    		= ${OWNER}-${TYPE_APP}-${SERVICE_NAME}-${ENV}
IMAGE_TAG				= v1.0.0
IMAGE_PROJECT 			= ${PROJECT_NAME}:${IMAGE_TAG}

PORT_CONTAINER			= 80
