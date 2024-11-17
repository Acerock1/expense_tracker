variable "table_name" {
  description = "The name of the DynamoDB table"
  type        = string
}

variable "hash_key" {
  description = "The attribute to use as the hash (partition) key"
  type        = string
}

variable "hash_key_type" {
  description = "The data type of the hash key attribute (S for string, N for number, B for binary)"
  type        = string
  default     = "S"
}

variable "range_key" {
  description = "The attribute to use as the range (sort) key, if any"
  type        = string
  default     = null
}

variable "range_key_type" {
  description = "The data type of the range key attribute (S for string, N for number, B for binary)"
  type        = string
  default     = "S"
}

variable "billing_mode" {
  description = "Billing mode for the table (PROVISIONED or PAY_PER_REQUEST)"
  type        = string
  default     = "PROVISIONED"
}

variable "read_capacity" {
  description = "Read capacity units (if using PROVISIONED billing mode)"
  type        = number
  default     = 5
}

variable "write_capacity" {
  description = "Write capacity units (if using PROVISIONED billing mode)"
  type        = number
  default     = 5
}

variable "enable_encryption" {
  description = "Enable server-side encryption at rest"
  type        = bool
  default     = true
}

variable "kms_key_arn" {
  description = "ARN of the KMS key to use for encryption (if not using default AWS managed key)"
  type        = string
  default     = null
}

variable "global_secondary_indexes" {
  description = "A list of global secondary indexes to create"
  type = list(object({
    name            = string
    hash_key        = string
    range_key       = string
    projection_type = string
    read_capacity   = number
    write_capacity  = number
  }))
  default = []
}

variable "tags" {
  description = "A map of tags to assign to the DynamoDB table"
  type        = map(string)
  default     = {}
}
