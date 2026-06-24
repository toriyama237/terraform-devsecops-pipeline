variable "name_prefix" {
  description = "Préfixe appliqué au nom des ressources réseau."
  type        = string
}

variable "vpc_cidr" {
  description = "Bloc CIDR de la VPC."
  type        = string
}

variable "admin_cidrs" {
  description = "CIDR autorisés pour l'administration (SSH)."
  type        = list(string)
}

variable "account_id" {
  description = "Identifiant du compte AWS (utilisé dans la policy KMS)."
  type        = string
}

variable "region" {
  description = "Région AWS (utilisée pour le principal CloudWatch Logs)."
  type        = string
}
