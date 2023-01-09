resource "azurerm_resource_group" "apprg" {
  name     = "rg-app-services"
  location = "West Europe"
}
resource "azurerm_service_plan" "my-app-plan" {
  name                = "example"
  resource_group_name = azurerm_resource_group.apprg.name
  location            = "West Europe"
  os_type             = "Linux"
  sku_name            = "P1v2"
}
resource "azurerm_linux_web_app" "example" {
  name                = "mywebapp001"
  resource_group_name = azurerm_resource_group.apprg.name
  location            = "West Europe"
  service_plan_id     = azurerm_service_plan.my-app-plan.id

  site_config {}
}