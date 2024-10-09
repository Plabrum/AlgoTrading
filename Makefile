# Makefile for managing the Python project

.PHONY: install format lint test run check-all

# Install dependencies
install:
	poetry install

# Format code using Black and isort
format:
	poetry run black my_project tests
	poetry run isort my_project tests

# Lint the code with pylint
lint:
	poetry run pylint my_project

# Run type checks with mypy
type-check:
	poetry run mypy my_project

# Run tests
test:
	poetry run pytest

# Run the Starlite app using Uvicorn
run:
	poetry run uvicorn my_project.app:app --reload

# Run all checks (linting, type checks, formatting, and tests)
check-all: lint type-check format test
