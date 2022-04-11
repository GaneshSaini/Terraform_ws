# Input Variables
# Environment Variable
variable "environment" {
  description = "Environment Variable used as a prefix"
  type = string
  default = "dev1"
}
# Business unit
variable "business_unit" {
  description = "Business Division in the large organization this Infrastructure belongs"
  type = string
  default = "SAP"
}
