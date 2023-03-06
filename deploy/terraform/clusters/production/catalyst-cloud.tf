locals {
  auth_url = "${lookup(local.auth_urls, var.catalyst_cloud_region, "expect valid region")}/v${local.identity_api_version}"
  auth_urls = {
    "nz-hlz-1" = "https://api.nz-hlz-1.catalystcloud.io:5000"
    "nz-por-1" = "https://api.nz-por-1.catalystcloud.io:5000"
    "nz_wlg_2" = "https://api.cloud.catalyst.net.nz:5000"
  }
  identity_api_version = 3
}
