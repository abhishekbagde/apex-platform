run "outputs_test" {
  module {
    source = "./."
  }

  assert {
    condition     = module.container_app_fqdn != null
    error_message = "Container App FQDN should not be null"
  }

  assert {
    condition     = contains(module.resource_group_name, "rg-testapp-dev-uks")
    error_message = "Resource group name does not follow convention"
  }
}