module "aws_backup_example" {

  source = "lgallard/backup/aws"

  # Vault
  vault_name        = var.vault_name
  vault_kms_key_arn = var.kms_arn
  # Plan
  plan_name = var.plan_name

  # Multiple rules using a list of maps
  rules = [
    {
      name              = "rule"
      schedule          = var.cron_expression
      target_vault_name = null
      start_window      = 120
      completion_window = 360
      lifecycle = {
        cold_storage_after = 0
        delete_after       = 90
      },
      recovery_point_tags = {
        Environment = "prod"
      }
    }
  ]

  # Multiple selections
  #  - Selection-1: By tags: Environment = prod, Owner = devops
  selections = [
    {
      name = "selection-1"
      selection_tags = [
        {
          type  = "STRINGEQUALS"
          key   = var.backup_key
          value = var.backup_value
        }
      ]
    }
  ]
  # tags = {
  #   Owner       = "devops"
  #   Environment = "prod"
  #   Terraform   = true
  # }
  lifecycle {
    prevent_destroy = true
  }
}
