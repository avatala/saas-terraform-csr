provider "github" {
  token   = data.google_secret_manager_secret_version.github_token.secret_data
  owner   = data.google_secret_manager_secret_version.github_org.secret_data
}