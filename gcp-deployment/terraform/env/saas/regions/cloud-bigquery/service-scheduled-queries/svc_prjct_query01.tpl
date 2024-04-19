# /*
#  * Copyright 2022 Google LLC. 
#  * 
#  * This software is provided as-is, without warranty or representation for any use or purpose. 
#  * Your use of it is subject to your agreement with Google.
#  */

INSERT INTO `PREFIX_NAME-admin-host.PREFIX_NAME_us_bigquery_host_prjct.gke_cluster_resource_consumption`
SELECT * FROM `PREFIX_NAME-freemium-prj.PREFIX_NAME_us_bigquery01.gke_cluster_resource_consumption` 
where date(start_time) = current_date()
and CAST(start_time as time) between '00:00:00' and '11:59:59'