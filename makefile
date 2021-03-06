.PHONY: install types token npmjs publish publish-npmjs lint clean

DOCKER_COMPOSE_RUN_OPTIONS=--rm

ifeq (${CI},true)
	DOCKER_COMPOSE_RUN_OPTIONS=--rm --user root -T
endif

PACKAGE_VERSION=$(shell cat package.json | grep -i version | sed -e "s/ //g" | cut -c 12- | sed -e "s/\",//g")

install:
	docker-compose run $(DOCKER_COMPOSE_RUN_OPTIONS) yarn install

types:
	docker-compose run $(DOCKER_COMPOSE_RUN_OPTIONS) yarn types

npmjs:
	docker-compose run $(DOCKER_COMPOSE_RUN_OPTIONS) bash -c 'echo "//registry.npmjs.org/:_authToken=$$NPMJS_AUTH_TOKEN" >> .npmrc'
	docker-compose run $(DOCKER_COMPOSE_RUN_OPTIONS) bash -c 'echo "@benjaminnoufel:registry=https://registry.npmjs.org/" >> .npmrc'

token:
	@docker-compose run $(DOCKER_COMPOSE_RUN_OPTIONS) bash -c 'echo "//npm.pkg.github.com/:_authToken=$$NPM_AUTH_TOKEN" > .npmrc'
	@docker-compose run $(DOCKER_COMPOSE_RUN_OPTIONS) bash -c 'echo "@benjaminnoufel:registry=https://npm.pkg.github.com/" >> .npmrc'

peer:
	docker-compose run $(DOCKER_COMPOSE_RUN_OPTIONS) yarn add -P react@17 @types/react@17

publish:
	docker-compose run $(DOCKER_COMPOSE_RUN_OPTIONS) yarn publish --access public --registry https://npm.pkg.github.com/ --new-version $(PACKAGE_VERSION) --non-interactive

publish-npmjs:
	docker-compose run $(DOCKER_COMPOSE_RUN_OPTIONS) yarn publish --access public --registry https://registry.npmjs.org/ --new-version $(PACKAGE_VERSION) --non-interactive

clean:
	docker-compose run $(DOCKER_COMPOSE_RUN_OPTIONS) bash -c 'for file in $(shell cat .gitignore); do if [ "/.env" != "$$file" ]; then rm -rf .$$file; fi; done'

lint:
	@docker-compose run $(DOCKER_COMPOSE_RUN_OPTIONS) yarn lint
