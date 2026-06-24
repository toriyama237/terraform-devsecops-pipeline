provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = var.project_name
      Environment = var.environment
      ManagedBy   = "Terraform"
      Pipeline    = "GitHub-Actions"
    }
  }

  # Ces options permettent à `terraform plan` de fonctionner en CI sans
  # identifiants AWS réels (analyse statique + plan d'une création de
  # ressources). En déploiement réel, l'authentification se fait via OIDC.
  access_key                  = var.ci_mode ? "ci-fake-access-key" : null
  secret_key                  = var.ci_mode ? "ci-fake-secret-key" : null
  skip_credentials_validation = var.ci_mode
  skip_requesting_account_id  = var.ci_mode
  skip_metadata_api_check     = var.ci_mode
}
