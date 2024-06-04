variable user {
        type = string
}
variable role {
        type = string
}

output client-info {
        value = "My user is ${var.user}, my role is ${var.role}"
}
