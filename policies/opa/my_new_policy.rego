# policies/opa/my_new_policy.rego
package policy.my_new_policy

allow {
    input.request.method == "GET"
    input.user.role == "viewer"
}

allow {
    input.request.method == "POST"
    input.user.role == "admin"
}
