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
resource "azurerm_linux_web_app" "webapp001" {
  name                = "tj-01-mywebapp001"
  resource_group_name = azurerm_resource_group.apprg.name
  location            = "West Europe"
  service_plan_id     = azurerm_service_plan.my-app-plan.id
  site_config {
  minimum_tls_version = "1.2"
  }
}