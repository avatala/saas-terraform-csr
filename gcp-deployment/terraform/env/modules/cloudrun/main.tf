# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

/******************************************
	Cloud Run Configuration 
 *****************************************/
# locals {
#   # saas-prod-sql-us-ct1-pgsql
#   connection_name = "${var.project_id}:${var.region_name}:${var.cloudsql_name}"
#   /* serverless_vpc_connector = tolist(var.serverless_vpc_connector_name)[0] */
# }
locals {
  annotation =  {
        "autoscaling.knative.dev/maxScale"        = var.cloudrun_service_config["max_instances"],
        "autoscaling.knative.dev/minScale"        = var.cloudrun_service_config["min_instances"],
        # "run.googleapis.com/encryption-key"       = try(var.cloudrun_service_config["kms_key_path"], null)
        # "run.googleapis.com/cloudsql-instances"   = local.connection_name
        /* "run.googleapis.com/vpc-access-connector" = local.serverless_vpc_connector */
        # "run.googleapis.com/ingress"              = var.ingress_type
      }
  cmek_template_annotation = var.cloudrun_service_config["kms_key_path"] != "null" ? { "run.googleapis.com/encryption-key" = var.cloudrun_service_config["kms_key_path"] } : {}
  template_annotations     = merge(local.annotation, local.cmek_template_annotation)
}

resource "google_cloud_run_service" "cloudrun_app" {
  provider = google-beta
  name     = var.cloudrun_service_config["service_name"]
  location = var.region_name
  project  = var.project_id

  template {
    spec {
      containers {
        image = var.cloudrun_service_config["container_image"]
        resources {
          limits = {
            cpu    = "2.0"
            memory = "4Gi"  #GiB
          }
          requests = {
            cpu    = "2.0"
            memory = "4Gi"
          }
        }
        # env {
        #   name = "HotPotSharedOptions:EnableLoadIdentifierUtcOffsetInfoFromDataBase"
        #    value = "FALSE"
        # }
        # env {
        #  name = "HotPotSharedOptions:GatewayOptions:MapMasterGatewayOptions:EndPoint"
        #   value = "http://xmapmaster.pilot.xgnt.internal"
        # }
        # env {
        #  name = "HotPotSharedOptions:GatewayOptions:TimelineDataGatewayOptions:EndPoint"
        #   value = "http://xtimelinedata.pilot.xgnt.internal"
        # }
        # env {
        #  name = "HotPotSharedOptions:UsageLogOptions:KafkaClientOptions:bootstrap.servers"
        #   value = "broker.pilot.xgnt.internal:9092"
        # }
        # env {
        #  name = "RedisClientOptions:ConnectionOptions:Master:ConnectionString"
        #   value = "mapmaster-cache.pilot.xgnt.internal:6379"
        # }
        # env {
        #  name = "RedisClientOptions:ConnectionOptions:Ticks:ConnectionString"
        #   value = "bars-cache.pilot.xgnt.internal:6379"
        # }
        # env {
        #  name = "StratusConfigOptions:IntradayTicksAWSMySQLReadOnlyConnectionStringShard:IntradayTicksShardA"
        #   value = "server=mysql.pilot.xgnt.internal;user=ReadUser;database=IntradayTicks0;port=3306;password=i8I%8GQ756CT;maxpoolsize=50;CacheServerProperties=true;"
        # }
        # env {
        #  name = "StratusConfigOptions:IntradayTicksAWSMySQLReadOnlyConnectionStringShard:IntradayTicksShardB"
        #   value = "server=mysql.pilot.xgnt.internal;user=ReadUser;database=IntradayTicks0;port=3306;password=i8I%8GQ756CT;maxpoolsize=50;CacheServerProperties=true;"
        # }
        # env {
        #  name = "StratusConfigOptions:IntradayTicksAWSMySQLReadWriteConnectionStringShard:IntradayTicksShardA"
        #   value = "server=mysql.pilot.xgnt.internal;user=ReadWriteUser;database=IntradayTicks0;port=3306;password=58RR%qeSy7h3;maxpoolsize=50;CacheServerProperties=true;"
        # }
        # env {
        #  name = "StratusConfigOptions:IntradayTicksAWSMySQLReadWriteConnectionStringShard:IntradayTicksShardB"
        #   value = "server=mysql.pilot.xgnt.internal;user=ReadWriteUser;database=IntradayTicks0;port=3306;password=58RR%qeSy7h3;maxpoolsize=50;CacheServerProperties=true;"
        # }
        ports {
        container_port = "${var.container_port}"
        }	
        command = [""]
        args    = [""]
      }
      container_concurrency = var.cloudrun_service_config["container_concurrency"]
      timeout_seconds       = var.cloudrun_service_config["timeout_seconds"]
      service_account_name  = var.cloudrun_service_config["service_account_name"]
    }
    metadata {
      annotations = local.template_annotations
      labels = {
	      "name" = var.cloudrun_service_config["container_label"]
	    }
    }
  }
  metadata {
    labels = {
    	"name" = var.cloudrun_service_config["cloudrun_label"]
    }
    annotations = {
      "run.googleapis.com/ingress" = var.ingress_type
      "run.googleapis.com/binary-authorization" = var.cloudrun_service_config["binary_authorization"]
    }
  }
  traffic {
    percent         = var.cloudrun_service_config["traffic_percent"]
    latest_revision = true
  }
  
}

resource "google_cloud_run_service_iam_member" "member" {
  location = google_cloud_run_service.cloudrun_app.location
  project = google_cloud_run_service.cloudrun_app.project
  service = google_cloud_run_service.cloudrun_app.name
  role = "roles/run.invoker"
  member = var.member // access for all authenticated users "allUsers"
}
