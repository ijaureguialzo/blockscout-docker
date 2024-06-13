#!make

ifneq (,$(wildcard ./.env))
    include .env
    export
else
$(error No se encuentra el fichero .env)
endif

NETWORK ?= "hardhat-network"

help: _header
	${info }
	@echo Opciones:
	@echo ----------------------
	@echo start / stop / restart
	@echo update
	@echo logs
	@echo clean
	@echo ----------------------

_header:
	@echo ----------
	@echo Blockscout
	@echo ----------

_urls: _header
	${info }
	@echo ----------------------------------
	@echo [Blockscout] http://localhost:9000
	@echo ----------------------------------

_start-command:
	@docker compose -f $(NETWORK).yml up -d

start: _start-command _urls

stop:
	@docker compose -f $(NETWORK).yml stop

restart: stop start

update:
	@docker compose -f $(NETWORK).yml pull

logs:
	@docker compose -f $(NETWORK).yml logs

clean:
	@docker compose -f $(NETWORK).yml down -v --remove-orphans
