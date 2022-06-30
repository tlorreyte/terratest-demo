output "bucket_arn" {
  value       = aws_s3_bucket.static.arn
  description = "Static bucket ARN"
}

output "bucket_endpoint" {
  value       = aws_s3_bucket_website_configuration.static.website_endpoint
  description = "Static bucket Endpoint"
}

output "ddb_name" {
  value       = aws_dynamodb_table.ddb.name
  description = "Name of the Dynamo Table"
}