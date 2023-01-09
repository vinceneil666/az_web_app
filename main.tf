resource "azurerm_resource_group" "apprg" {
  name     = "rg-app-services"
  location = "West Europe"
}
resource "azurerm_app_service_plan" "plan01" {
  name                = "app-service-plan"
  location            = "West Europe"
  resource_group_name = azurerm_resource_group.apprg.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}
resource "azurerm_app_service" "app-service" {
  name = "mywebapp"
  location = "West Europe"
  resource_group_name = azurerm_resource_group.apprg.name
  app_service_plan_id = azurerm_app_service_plan.plan01.id
  site_config {
    dotnet_framework_version = "v4.0"
  }
  tags = {
    environment = var.environment
  }
}