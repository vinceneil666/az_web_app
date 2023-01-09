resource "azurerm_resource_group" "example" {
  name     = "example"
  location = "West Europe"
}
resource "azurerm_resource_group" "example2" {
  name     = "example2"
  location = "West Europe"
}
resource "azurerm_app_service_plan" "example" {
  name                = "example-appserviceplan"
  location            = "West Europe"
  resource_group_name = azurerm_resource_group.example.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}