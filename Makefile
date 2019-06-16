IMAGE := devilrancy/node-hello
VERSION:= $(shell grep VERSION Dockerfile | awk '{print $2}' | cut -d '=' -f 2)

test:
	true

image:
	docker build -t ${IMAGE}:${VERSION} .
	docker tag ${IMAGE}:${VERSION} ${IMAGE}:latest

push-image:
	docker push ${IMAGE}:${VERSION}
	docker push ${IMAGE}:latest

deploy:
	./terraform init application/
	./terraform apply application/ -auto-approve

.PHONY: image push-image test