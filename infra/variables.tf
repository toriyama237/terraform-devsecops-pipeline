variable "project_name" {
  description = "Nom du projet, utilisé pour nommer et taguer les ressources."
  type        = string
  default     = "terraform-devsecops"
}

variable "environment" {
  description = "Environnement cible (dev, staging, production)."
  type        = string
  default     = "production"

  validation {
    condition     = contains(["dev", "staging", "production"], var.environment)
    error_message = "L'environnement doit être dev, staging ou production."
  }
}

variable "aws_region" {
  description = "Région AWS de déploiement."
  type        = string
  default     = "eu-west-3"
}

variable "vpc_cidr" {
  description = "Bloc CIDR de la VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "admin_cidrs" {
  description = "Liste des CIDR autorisés à se connecter en SSH (jamais 0.0.0.0/0)."
  type        = list(string)
  default     = ["10.0.0.0/16"]

  validation {
    condition     = !contains(var.admin_cidrs, "0.0.0.0/0")
    error_message = "Ouvrir l'administration au monde entier (0.0.0.0/0) est interdit."
  }
}

variable "account_id" {
  description = "Identifiant du compte AWS cible (12 chiffres)."
  type        = string
  default     = "000000000000"
}

variable "ci_mode" {
  description = "Active le mode CI (identifiants AWS factices pour le plan hors-ligne)."
  type        = bool
  default     = false
}
