# Crear un dataset en BigQuery
resource "google_bigquery_dataset" "dataset_test" {
  dataset_id = "tf_dataset"  # ID del dataset
  location   = "US"             # Ubicación del dataset
  project    = "arcane-boulder-310022"  # ID del proyecto
}

# Crear una tabla en el dataset
resource "google_bigquery_table" "test_terraform_example_local" {
  dataset_id = google_bigquery_dataset.dataset_test.dataset_id  # Referencia al dataset creado
  table_id   = "test_tf_github_local"                         # ID de la tabla
  project    = "arcane-boulder-310022"                           # ID del proyecto

  # Esquema de la tabla
  schema = jsonencode([
    {
      "name" : "Nombres",
      "type" : "STRING",
      "mode" : "REQUIRED"
    },
    {
      "name" : "Edad",
      "type" : "INTEGER",
      "mode" : "NULLABLE"
    },
    {
      "name" : "Fecha",
      "type" : "DATE",
      "mode" : "NULLABLE"
    }
  ])
}

# Crear una vista
resource "google_bigquery_table" "view_test" {
  dataset_id = google_bigquery_dataset.dataset_test.dataset_id
  table_id   = "view_test_table"
  view {
    query = "SELECT Nombres, Edad FROM `${google_bigquery_dataset.dataset_test.dataset_id}.test_tf_github_local`"
    use_legacy_sql = false
  }
}
