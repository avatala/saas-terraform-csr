output "infra_repo_name" {
  description = "value of tenant infrastructure repository name"
  value       = github_repository.infrastructure_repo.name
}