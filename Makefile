#!/usr/bin/make

SHELL = /bin/bash

PHP_CLI_CONTAINER_NAME := backend-php-cli
NODE_CONTAINER_NAME := frontend-nodejs

docker := $(shell command -v docker 2> /dev/null)
docker_compose := $(shell command -v docker-compose 2> /dev/null)

# Docker aliases
version:
	$(docker_compose) --version

up:
	$(docker_compose) up --build -d

down:
	$(docker_compose) down

restart:
	$(docker_compose) restart


# General aliases
shell:
	$(docker_compose) exec "$(PHP_CLI_CONTAINER_NAME)" /bin/bash

%:
	@:


# Composer aliases
composer:
	$(docker_compose) exec "$(PHP_CLI_CONTAINER_NAME)" composer  $(filter-out $@,$(MAKECMDGOALS))

composer-install:
	$(docker_compose) exec "$(PHP_CLI_CONTAINER_NAME)" composer install --no-interaction --ansi --no-suggest

dumpautoload:
	$(docker_compose) exec "$(PHP_CLI_CONTAINER_NAME)" composer dumpautoload $(filter-out $@,$(MAKECMDGOALS))



# NPM aliases
npm-install:
	$(docker_compose) run --rm "$(NODE_CONTAINER_NAME)" npm install

watch:
	$(docker_compose) run --rm "$(NODE_CONTAINER_NAME)" npm run watch

dev:
	$(docker_compose) run --rm "$(NODE_CONTAINER_NAME)" npm run dev

prod:
	$(docker_compose) run --rm "$(NODE_CONTAINER_NAME)" npm run prod

deploy:
	$(docker_compose) run --rm "$(NODE_CONTAINER_NAME)" npm run deploy

test:
	$(docker_compose) exec "$(PHP_CLI_CONTAINER_NAME)" composer test


# PHP Atrisan aliases
art:
	$(docker_compose) exec "$(PHP_CLI_CONTAINER_NAME)" php artisan $(filter-out $@,$(MAKECMDGOALS))

controller:
	$(docker_compose) exec "$(PHP_CLI_CONTAINER_NAME)" php artisan make:controller $(filter-out $@,$(MAKECMDGOALS))

controllerandmodel:
	$(docker_compose) exec "$(PHP_CLI_CONTAINER_NAME)" php artisan make:controller -m $(filter-out $@,$(MAKECMDGOALS))

invokedcontroller:
	$(docker_compose) exec "$(PHP_CLI_CONTAINER_NAME)" php artisan make:controller -i $(filter-out $@,$(MAKECMDGOALS))

request:
	$(docker_compose) exec "$(PHP_CLI_CONTAINER_NAME)" php artisan make:request $(filter-out $@,$(MAKECMDGOALS))

model:
	$(docker_compose) exec "$(PHP_CLI_CONTAINER_NAME)" php artisan make:model $(filter-out $@,$(MAKECMDGOALS))

provider:
	$(docker_compose) exec "$(PHP_CLI_CONTAINER_NAME)" php artisan make:provider $(filter-out $@,$(MAKECMDGOALS))

events:
	$(docker_compose) exec "$(PHP_CLI_CONTAINER_NAME)" php artisan event:generate $(filter-out $@,$(MAKECMDGOALS))

modelandmigration:
	$(docker_compose) exec "$(PHP_CLI_CONTAINER_NAME)" php artisan make:model -m $(filter-out $@,$(MAKECMDGOALS))

modelandcontroller:
	$(docker_compose) exec "$(PHP_CLI_CONTAINER_NAME)" php artisan make:model -c $(filter-out $@,$(MAKECMDGOALS))

migration:
	$(docker_compose) exec "$(PHP_CLI_CONTAINER_NAME)" php artisan make:migration $(filter-out $@,$(MAKECMDGOALS))

migrate:
	$(docker_compose) exec "$(PHP_CLI_CONTAINER_NAME)" php artisan migrate $(filter-out $@,$(MAKECMDGOALS))

remigrate:
	$(docker_compose) exec "$(PHP_CLI_CONTAINER_NAME)" php artisan migrate:refresh $(filter-out $@,$(MAKECMDGOALS))

rollback:
	$(docker_compose) exec "$(PHP_CLI_CONTAINER_NAME)" php artisan migrate:rollback $(filter-out $@,$(MAKECMDGOALS))

seed:
	$(docker_compose) exec "$(PHP_CLI_CONTAINER_NAME)" php artisan db:seed $(filter-out $@,$(MAKECMDGOALS))

seedby:
	$(docker_compose) exec "$(PHP_CLI_CONTAINER_NAME)" php artisan db:seed --class=$(filter-out $@,$(MAKECMDGOALS))

routelist:
	$(docker_compose) exec "$(PHP_CLI_CONTAINER_NAME)" php artisan route:list $(filter-out $@,$(MAKECMDGOALS))

tinker:
	$(docker_compose) exec "$(PHP_CLI_CONTAINER_NAME)" php artisan tinker $(filter-out $@,$(MAKECMDGOALS))