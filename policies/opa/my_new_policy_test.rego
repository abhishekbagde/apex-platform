# policies/opa/my_new_policy_test.rego
package policy.my_new_policy

import data.policy.my_new_policy

test_allow_get_viewer if {
    my_new_policy.allow with input as {
        "request": {"method": "GET"},
        "user": {"role": "viewer"}
    }
}

test_deny_get_admin if {
    not my_new_policy.allow with input as {
        "request": {"method": "GET"},
        "user": {"role": "admin"}
    }
}

test_allow_post_admin if {
    my_new_policy.allow with input as {
        "request": {"method": "POST"},
        "user": {"role": "admin"}
    }
}

test_deny_post_viewer if {
    not my_new_policy.allow with input as {
        "request": {"method": "POST"},
        "user": {"role": "viewer"}
    }
}
