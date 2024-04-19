output "id" {
  description = "An identifier for the resource with format projects/{{project}}."
  value       = google_firebase_project.project.id
}

output "display_name" {
  description = "The GCP project display name."
  value       = google_firebase_project.project.display_name
}

output "database_id" {
  description = "An identifier for the resource with format projects/{{project}}/databases/{{name}}."
  value       = google_firestore_database.database.id
}
