resource "google_bigquery_table" "test_terraform_example" {
  dataset_id = "dataset_test"  
  table_id   = "test_tf_github_consola"    
  project    = "arcane-boulder-310022" 

   # Esquema de la tabla
  schema = jsonencode([
    {
      "name" : "Nombres",
      "type" : "STRING",
      "mode" : "REQUIRED"
    },
    {
      "name" : "Salario",
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