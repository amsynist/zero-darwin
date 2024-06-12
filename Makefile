# Makefile for managing Nix-Darwin and Home Manager configurations

# Default user and home directory
USERNAME ?= $(shell whoami)
HOME_DIR ?= /Users/$(USERNAME)

# Default target: show help
.DEFAULT_GOAL := help

.PHONY: help
help: ## Show this help message
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  %-20s %s\n", $$1, $$2}'

.PHONY: build
build: ## Build the configuration
	@echo "Building Nix-Darwin and Home Manager configurations..."
	@sudo nix build .#darwinConfigurations.${USERNAME}.system
	@sudo nix build .#homeConfigurations.${USERNAME}.activationPackage

.PHONY: switch
switch: ## Apply the new configuration
	@echo "Switching to the new Nix-Darwin configuration..."
	@sudo ./result/sw/bin/darwin-rebuild switch --flake .#${USERNAME}
	@echo "Activating the new Home Manager configuration..."
	@./result/activate

.PHONY: update
update: ## Update the flake.lock file
	@echo "Updating flake.lock..."
	@nix flake update

.PHONY: clean
clean: ## Clean build artifacts
	@echo "Cleaning build artifacts..."
	@rm -rf result

.PHONY: edit
edit: ## Edit the configuration
	@echo "Opening configuration files for editing..."
	@$(EDITOR) flake.nix

.PHONY: status
status: ## Show the current status
	@echo "Showing current Nix-Darwin and Home Manager status..."
	@sudo darwin-rebuild dry-run
	@home-manager build

.PHONY: darwin-refresh
darwin-refresh: ## Refresh Nix-Darwin configuration
	@echo "Refreshing Nix-Darwin configuration..."
	@darwin-rebuild switch --flake .

