package main

tested_resource := "aws_dynamodb_table"

resource_changes[addr] = resource {
        resource := input.resource_changes[_]

        action := resource.change.actions[_]
        not action == "delete"

        addr := resource.address
}

warn_high_read_ddb[msg] {
    some addr

    resource_changes[addr].type == tested_resource
    resource_changes[addr].change.after.read_capacity > 100

    msg := sprintf("%s seems to have a high read capacity.", [resource_changes[addr].address])
}