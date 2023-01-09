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
    linux_fx_version = "DOTNETCORE|2.2"
    min_tls_version = "1.2"
    always_on = true
    scm_type = "None"
    managed_pipeline_mode = "Integrated"
    websockets_enabled = false
    use_32_bit_worker_process = true
  }
}