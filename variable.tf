variable "region" {
  default = "ap-southeast-2"
}

variable "budget_name" {
    default = ""
    type = string
}

variable "budget_cost" {
    default = ""
    type = string
}

variable "budget_unit" {
    default = ""
    type = string
}

variable "time_unit" {
    default = ""
    type = string
}

variable "email_address" {
    default = ""
    type = string
}

variable "min_notification_threshold" {

}

variable "max_notification_threshold" {
    
}