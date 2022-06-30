terraform {
  required_providers {
    test = {
      source = "terraform.io/builtin/test"
    }

    http = {
      source = "hashicorp/http"
    }
  }
}

module "main" {
  source = "../.."
}

locals {
    ddb_name = module.main.ddb_name
}

resource "test_assertions" "ddb_endpoint" {
    component = "ddb_endpoint"

    equal "name" {
        description = "Name of test ddb"
        got = local.ddb_name
        want = "test-ddb-tlorrey"
    }
}