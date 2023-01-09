resource "azurerm_resource_group" "apprg" {
  name     = "rg-app-services"
  location = "West Europe"
}
resource "azurerm_service_plan" "my-app-plan" {
  name                = "appl-plan-01"
  resource_group_name = azurerm_resource_group.apprg.name
  location            = "West Europe"
  os_type             = "Linux"
  sku_name            = "P1v2"
}
resource "azurerm_windows_web_app" "webapp001" {
  name                = "tj-02-mywebapp001"
  resource_group_name = azurerm_resource_group.apprg.name
  location            = "West Europe"
  service_plan_id     = azurerm_service_plan.my-app-plan.id
  site_config {
  minimum_tls_version = "1.2"
  }
}
#  Deploy code from a public GitHub repo
resource "azurerm_app_service_source_control" "sourcecontrol" {
  app_id             = azurerm_windows_web_app.webapp001.id
  repo_url           = "https://github.com/vinceneil666/generic-webpage.git"
  branch             = "master"
  use_manual_integration = true
  use_mercurial      = false
}