#!make

help: _header
	${info }
	@echo Opciones:
	@echo ----------------------
	@echo start / stop / restart
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
	@docker compose stop

restart: stop start

logs:
	@docker compose logs

clean:
	@docker compose down -v --remove-orphans