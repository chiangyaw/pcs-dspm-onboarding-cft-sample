module "dig_security_orchestrator" {
    source                           = "https://onboarding.use1.dig.security/gcp/terraform/latest/orchestrator-terraform.zip//modules/orchestrator_project"
    tenant_id                        = "<Tenant ID"
    external_id                      = "<External ID>"
}