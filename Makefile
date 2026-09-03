.PHONY: setup dev test test-int leak-test demo lint fix format typecheck check help

setup: ## uv sync the whole workspace (all 6 Python members, 1 venv)
	uv sync

dev: ## bring up the default compose profile (pgvector/pgvector:pg17) — wired in P3/P9
	docker compose up -d

fix: ## tự động format code, sắp xếp import và sửa các lỗi ruff cho phép
	uv run ruff check --fix --unsafe-fixes .
	uv run ruff format .

format: fix ## alias cho target fix

typecheck: ## chạy kiểm tra kiểu mypy trên toàn bộ packages và apps
	uv run mypy packages apps

lint: ## kiểm tra ruff, mypy strict và import-linter layers-contract (giống CI)
	uv run ruff check .
	uv run ruff format --check .
	uv run mypy packages apps
	uv run lint-imports

check: lint test ## kiểm tra toàn diện trước khi commit (lint + typecheck + pytest)

test: ## run the full pytest suite across the workspace
	uv run pytest

test-int: ## bring up the isolated test-stack compose file, then run tests against it — wired in P9
	docker compose -f docker-compose.test.yml up -d --wait
	uv run pytest

leak-test: ## RLS/tenant leak-test — has teeth by design (a leaky kb.search stays RED) — wired in P5
	uv run pytest packages/kb/tests/test_leak.py

demo: ## 8-step lifecycle demo harness — wired in P10
	@echo "demo target — wired in P10 (Frontend + E2E + Docs)"

help: ## hiển thị danh sách các lệnh make khả dụng
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'