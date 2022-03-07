variable "bucket_name" {
  type        = string
  description = "Static bucket name"
  default     = "static-terratest-tlorreyte"
}

variable "tags" {
  type        = map(string)
  description = "Static bucket tags"
  default = {
    Name    = "static-terratest-tlorreyte"
    Project = "terratest-article"
  }
}