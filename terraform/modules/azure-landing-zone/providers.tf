provider "azurerm" {
  alias = "hub"
  features {}
  # These are placeholder values to satisfy validation.
  # In a real deployment, these would be configured by the root module.
  subscription_id = "00000000-0000-0000-0000-000000000000"
}
