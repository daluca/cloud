data "github_branch" "environment" {
  repository = data.github_repository.main.id
  branch     = var.github.branch != null ? var.github.branch : data.github_repository.main.default_branch
}
