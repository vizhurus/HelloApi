.PHONY: help venv install run lint format test docker-build docker-up docker-down

help:
	@echo "Доступные команды:"
	@echo "  make venv          - создать виртуальное окружение"
	@echo "  make install       - установить зависимости"
	@echo "  make run           - запустить сервер локально"
	@echo "  make lint          - запустить ruff (проверка)"
	@echo "  make format        - запустить ruff (форматирование)"
	@echo "  make test          - запустить pytest"
	@echo "  make docker-build  - собрать Docker-образ"
	@echo "  make docker-up     - запустить сервис через Docker"
	@echo "  make docker-down   - остановить Docker"

venv:
	uv venv

install:
	uv sync

run:
	uvicorn app.main:app --reload

lint:
	ruff check .

format:
	ruff format .

test:
	pytest

docker-build:
	docker build -t helloapi .

docker-up:
	docker compose up --build

docker-down:
	docker compose down
