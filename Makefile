NAME := devops/drupalwxt
VERSION := $(or $(VERSION),$(VERSION),'latest')
PLATFORM := $(shell uname -s)

all: base

build: all

base:
	helm install .

clean:

azure:
	az group create --name kubeResourceGroup \
									--location eastus

	az acs create --orchestrator-type kubernetes \
								--resource-group kubeResourceGroup \
								--name myK8sCluster \
								--generate-ssh-keys \
								--agent-vm-size Standard_DS3_v2_Promo

clean_azure:
	az group delete --name kubeResourceGroup \
									--yes \
									--no-wait

lint:
	helm lint .

.PHONY: \
	all \
	azure \
	base \
	build \
	clean \
	clean_azure \
	lint