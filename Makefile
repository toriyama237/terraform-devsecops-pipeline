.DEFAULT_GOAL := help
WORKING_DIR   := infra

.PHONY: help fmt lint security init validate plan apply destroy ci

help: ## Affiche cette aide
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-12s\033[0m %s\n", $$1, $$2}'

fmt: ## Reformate le code Terraform
	terraform fmt -recursive

lint: ## Vérifie le formatage et lance TFLint
	terraform fmt -recursive -check -diff
	tflint --init
	tflint --recursive

security: ## Analyse statique de sécurité (Trivy)
	trivy config --severity HIGH,CRITICAL --exit-code 1 .

init: ## Initialise Terraform (sans backend, pour la CI/locale)
	terraform -chdir=$(WORKING_DIR) init -backend=false

validate: ## Valide la configuration Terraform
	terraform -chdir=$(WORKING_DIR) validate

plan: ## Génère le plan (mode CI hors-ligne)
	terraform -chdir=$(WORKING_DIR) plan -var ci_mode=true

apply: ## Applique l'infrastructure (nécessite des identifiants AWS réels)
	terraform -chdir=$(WORKING_DIR) apply

destroy: ## Détruit l'infrastructure
	terraform -chdir=$(WORKING_DIR) destroy

ci: lint security init validate plan ## Rejoue tout le pipeline en local
