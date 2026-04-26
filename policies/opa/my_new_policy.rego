# policies/opa/my_new_policy.rego
package policy.my_new_policy

allow if {
    input.request.method == "GET"
    input.user.role == "viewer"
}

allow if {
    input.request.method == "POST"
    input.user.role == "admin"
}
