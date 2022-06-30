package main

tested_resource := "aws_dynamodb_table"

resource_changes[addr] = resource {
        resource := input.resource_changes[_]

        action := resource.change.actions[_]
        not action == "delete"

        resource.change.type == tested_resource

        addr := resource.address
}

warn_high_read_ddb[msg] {
    some addr

    resource_changes[addr].after.point_in_time_recovery > 100

    msg := sprintf("%s seems to have a high read capacity.", [resource_changes[addr].address])
}