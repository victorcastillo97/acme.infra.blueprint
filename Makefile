.DEFAULT_GOAL := help
include makefiles/docker.mk
include makefiles/tf-backend.mk
include makefiles/tf-vpc.mk
include makefiles/tf-eks.mk
include makefiles/tf-eks-lb-controller.mk

OWNER          	= acme
ENV             ?= dev
REGION 			= us-east-2

# Docker
IMAGE 			= ${OWNER}-terraform:latest
TF_DIR       	= infra

#AWS Config
PATH_AWS_CREDENTIALS 	= C:/Users/accha/.aws
AWS_PROFILE 			= entrepenur
AWS_ACCOUNT_ID 			= $(shell aws sts get-caller-identity --query "Account" --output text --profile $(AWS_PROFILE))

## HELP ##
help:
	@printf "\033[31m%-16s %-39s %s\033[0m\n" "Target" "Help" "Usage"; \
	printf "\033[31m%-16s %-39s %s\033[0m\n" "------" "----" "-----"; \
	grep -hE '^\S+:.*## .*$$' $(MAKEFILE_LIST) | sed -e 's/:.*##\s*/:/' | sort | awk 'BEGIN {FS = ":"}; {printf "\033[32m%-16s\033[0m %-38s \033[34m%s\033[0m\n", $$1, $$2, $$3}'