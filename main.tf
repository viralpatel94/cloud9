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
  secret_name = var.TeamIDRepoName
  token_value = var.token
}
module "backup" {
  source       = "./backup"
  kms_arn      = module.cloud9.kms_id
  backup_key   = "TeamIDRepoName"
  backup_value = var.TeamIDRepoName
  vault_name   = "${var.TeamIDRepoName}-vault"
  plan_name    = "${var.TeamIDRepoName}-plan"
}

module "cloud9" {
  source            = "./cloud9"
  name              = var.TeamIDRepoName
  instance_type     = var.instance_type
  subnet            = data.terraform_remote_state.vpc.outputs.public_subnets[0]
  Github_repo_owner = var.Github_repo_owner
  Github_repo_name  = var.Github_repo_name
  secret_arn        = module.secrets.secret_arn
  access_key        = var.access_key
  secret_key        = var.secret_key
  CS_Creator_Email  = var.CS_Creator_Email
}
