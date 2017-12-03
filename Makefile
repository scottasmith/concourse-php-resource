DOCKER_TAG?=latest
DOCKER_REPO=scottsmith/concourse-php-resource

default:
	docker build -t $(DOCKER_REPO):$(DOCKER_TAG) .

push: default
	docker push $(DOCKER_REPO):$(DOCKER_TAG)
