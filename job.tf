resource "kubernetes_cron_job" "postgres_backup_job" {
  metadata {
    name      = "postgres-backup"
    namespace = "data"
  }
  spec {
    concurrency_policy            = "Replace"
    failed_jobs_history_limit     = 5
    schedule                      = "0 4 * * *"
    starting_deadline_seconds     = 10
    successful_jobs_history_limit = 10
    job_template {
      metadata {}
      spec {
        backoff_limit              = 2
        ttl_seconds_after_finished = 10
        template {
          metadata {}
          spec {
            container {
              name  = "postgres-backup"
              image = "mdillon/postgis:11"

              env {
                name  = "POSTGRES_USER"
                value = "admin"
              }
              env {
                name  = "POSTGRES_PASSWORD"
                value = "sUpeRp4ssw0rd!"
              }
              env {
                name  = "AWS_DEFAULT_REGION"
                value = "us-east-1"
              }
              env {
                name  = "S3_BACKUP_PATH"
                value = "s3://${var.prefix}-${var.environment}-db-backup/postgres-backup"
              }
              command = ["/bin/sh", "-c", "/do_backup.sh"]
            }
            service_account_name = "custom-sa-postgres-backup-dev"
          }
        }
      }
    }
  }
}

