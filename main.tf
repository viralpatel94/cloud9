provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

data "terraform_remote_state" "vpc" {
  backend = "remote"
  config = {
    organization = var.tfc_org
    workspaces = {
      name = var.tfc_workspace
    }
  }
}
module "secrets" {
  source      = "./secrets"
  kms_arn     = module.cloud9.kms_id
  secret_name = var.team_id-repo_name
  token_value = var.token
}
module "backup" {
  source       = "./backup"
  kms_arn      = module.cloud9.kms_id
  backup_key   = "team_id-repo_name"
  backup_value = var.team_id-repo_name
  vault_name   = "${var.name}-vault"
  plan_name    = "${var.name}-plan"
}

module "cloud9" {
  source            = "./cloud9"
  name              = var.team_id-repo_name
  instance_type     = var.instance_type
  subnet            = data.terraform_remote_state.vpc.outputs.public_subnets[0]
  Github_repo_owner = var.Github_repo_owner
  Github_repo_name  = var.Github_repo_name
  secret_arn        = module.secrets.secret_arn
  access_key        = var.access_key
  secret_key        = var.secret_key
}
