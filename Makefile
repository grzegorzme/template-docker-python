#################################################################################
# GLOBALS                                                                       #
#################################################################################

PYTHON ?= python3.8
PROJECT_NAME := docker-python-app

PROJECT_DIR := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
SRC_DIR := $(PROJECT_DIR)/src
TESTS_DIR = $(PROJECT_DIR)/tests

#################################################################################
# pipenv management                                                             #
#################################################################################

.PHONY: env-dev
env-dev:
	PIPENV_VENV_IN_PROJECT=1 pipenv install --dev

.PHONY: env-rm
env-rm:
	pipenv --rm

#################################################################################
# code test / lint                                                              #
#################################################################################

.PHONY: format-check
format-check:
	pipenv run black --check $(PROJECT_DIR)/

.PHONY: format-apply
format-apply:
	pipenv run black $(PROJECT_DIR)/

.PHONY: test
test:
	pipenv run pytest $(PROJECT_DIR)

.PHONY: lint
lint:
	pipenv run pylint --rcfile=setup.cfg main.py $(SRC_DIR)
