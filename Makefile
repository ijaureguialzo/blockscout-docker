#!make

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
	@echo -----------------------------
	@echo [Blockscout] http://localhost
	@echo -----------------------------

_start-command:
	@docker compose -f hardhat-network.yml up -d

start: _start-command _urls

stop:
	@docker compose -f hardhat-network.yml stop

restart: stop start

update:
	@docker compose -f hardhat-network.yml pull

logs:
	@docker compose -f hardhat-network.yml logs

clean:
	@docker compose -f hardhat-network.yml down -v --remove-orphans
