resource "aws_budgets_budget" "account" {
  name              = var.budget_name
  budget_type       = "COST"
  limit_amount      = var.budget_cost
  limit_unit        = var.budget_unit
  time_unit         = var.time_unit

  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = var.min_notification_threshold
    threshold_type             = "PERCENTAGE"
    notification_type          = "ACTUAL"
    subscriber_email_addresses = [var.email_address]
  }
  
  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = var.min_notification_threshold
    threshold_type             = "PERCENTAGE"
    notification_type          = "FORECASTED"
    subscriber_email_addresses = [var.email_address]
  }
}