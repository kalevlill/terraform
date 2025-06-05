locals {
  network_name = "app_net"
  log_volume   = local.enable_logging ? "log_vol" : ""
  enable_logging = var.enable_logging
}
