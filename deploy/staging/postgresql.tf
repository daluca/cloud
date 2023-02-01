resource "postgresql_role" "miniflux" {
  name     = "miniflux"
  login    = true
  password = var.postgresql_miniflux_password
}

resource "postgresql_database" "miniflux" {
  name  = "miniflux"
  owner = postgresql_role.miniflux.id
}

resource "postgresql_extension" "miniflux" {
  name = "hstore"
}

resource "postgresql_role" "focalboard" {
  name     = "focalboard"
  login    = true
  password = var.postgresql_focalboard_password
}

resource "postgresql_database" "focalboard" {
  name  = "focalboard"
  owner = postgresql_role.focalboard.id
}
