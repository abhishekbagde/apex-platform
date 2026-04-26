run "outputs_test" {
  module {
    source = "../.."
    application_name = "testapp"
    environment      = "dev"
    location         = "uksouth"
    team             = "testteam"
    cost_centre      = "CC-TEST"
    container_image  = "testimage:latest"
    log_analytics_workspace_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-test/providers/Microsoft.OperationalInsights/workspaces/law-test"
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