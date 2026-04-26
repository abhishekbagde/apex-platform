# policies/opa/my_new_policy_test.rego
package policy.my_new_policy

import data.policy.my_new_policy

test_allow_get_viewer {
    my_new_policy.allow with input as {
        "request": {"method": "GET"},
        "user": {"role": "viewer"}
    }
}

test_deny_get_admin {
    not my_new_policy.allow with input as {
        "request": {"method": "GET"},
        "user": {"role": "admin"}
    }
}

test_allow_post_admin {
    my_new_policy.allow with input as {
        "request": {"method": "POST"},
        "user": {"role": "admin"}
    }
}

test_deny_post_viewer {
    not my_new_policy.allow with input as {
        "request": {"method": "POST"},
        "user": {"role": "viewer"}
    }
}
