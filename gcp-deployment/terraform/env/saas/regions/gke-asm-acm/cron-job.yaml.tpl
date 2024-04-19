apiVersion: v1
kind: Namespace 
metadata:
  name: cronjob
---
apiVersion: v1
kind: ServiceAccount
metadata:
  name: cronjob
  namespace: cronjob
---
apiVersion: batch/v1
kind: CronJob
metadata:
  name: cronjob
  namespace: cronjob
spec:
  schedule: "*/5 * * * *"
  jobTemplate:
    spec:
      template:
        spec:
          containers:
            - name: container
              image: google/cloud-sdk:slim
              command: ["/test/my-script.sh"]
              volumeMounts:
                - name: config-volume
                  mountPath: /test/
          restartPolicy: OnFailure
          serviceAccountName:  cronjob
          volumes:
            - name: config-volume
              configMap:
                name: configmap
                defaultMode: 0500
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: configmap
  namespace: cronjob
data:
  my-script.sh: |
    #!/bin/bash

    gsutil -m ls gs://PREFIX_NAME-onboarding-bucket/| sed 's#.*\/\(.*\)\/$#\1#' > object.txt
    gsutil -m  cp -r gs://PREFIX_NAME-onboarding-bucket/ .
    
    if [ "$(ls -A PREFIX_NAME-onboarding-bucket/)" ]; then
      echo "Folder is not empty. Perform some action."
      gcloud source repos clone APPREPONAME --project=PROJECTID
      cd APPREPONAME/
      git checkout  _TERRAFORM_CODE_BRANCH_NAME
      cd ../

      src_dir="PREFIX_NAME-onboarding-bucket"

      dst_dir="APPREPONAME"

      while read folder_name; do
      # Copy the folder from the source directory to the destination directory
      cp -r $src_dir/$folder_name/ $dst_dir/multi-tenant/namespaces/
      done < object.txt

      cd APPREPONAME/
      git add .
      git config --global user.email "cron@example.com"
      git config --global user.name "cron job"
      git status
      git commit -m "All application pushed"
      git push origin _TERRAFORM_CODE_BRANCH_NAME
      # Change Directory and delete the file
      cd ../

      while read folder_name; do
        # Copy the folder from the source directory to the destination directory
        gsutil -m rm -r  gs://PREFIX_NAME-onboarding-bucket/$folder_name
        echo "Deleted folder from bucket"
      done < object.txt

      sleep 120
      # Trigger the next cloud build trigger
      while read folder_name; do
      gcloud alpha builds triggers list --region=REGION_NAME --project PROJECTID  --format="value(name)" | grep $folder_name >> file.txt
        if [ "$(cat file.txt)" ]; then
          echo "File is not empty."
          if [ "LB_TYPE" = "http" ]; then
            while read file_name; do
              if [[ $file_name == $folder_name-multi-tenant-dns-mapping-saas-trigger ]]; then
                echo "Trigger found run this trigger"
                # Perform some action if the character is found
                gcloud alpha builds triggers run --region=REGION_NAME $folder_name-multi-tenant-dns-mapping-saas-trigger --branch=$folder_name --project PROJECTID
              fi
            done < file.txt
            else
            while read file_name; do
              if [[ $file_name == $folder_name-multi-tenant-tcp-tenant-mapping-saas-trigger ]]; then
                echo "Trigger found run this trigger"
                # Perform some action if the character is found
                gcloud alpha builds triggers run --region=REGION_NAME $folder_name-multi-tenant-tcp-tenant-mapping-saas-trigger --branch=$folder_name --project PROJECTID
              fi
            done < file.txt
          fi
        else
          echo "File empty. Do nothing."
        fi
      done < object.txt
    else
      echo "Folder is empty. Do nothing."
      # Do nothing if the folder is empty
    fi

    # Offboarding tenant script
    gsutil -m ls gs://PREFIX_NAME-offboarding-bucket/| sed 's|.*/\(.*\)\.txt|\1|' > offboard.txt

    if [ "$(cat offboard.txt)" ]; then
        echo "File is not empty."
        
        gcloud source repos clone APPREPONAME --project=PROJECTID
        cd APPREPONAME/
        git checkout  _TERRAFORM_CODE_BRANCH_NAME
        cd ../
        while read customer_name; do
        rm -rf  APPREPONAME/multi-tenant/namespaces/$customer_name/
        done < offboard.txt
        cd APPREPONAME/
        git add .
        git config --global user.email "cron@example.com"
        git config --global user.name "cron job"
        git status
        git commit -m "All application deleted"
        git push origin _TERRAFORM_CODE_BRANCH_NAME

        cd ../

        while read customer_name; do
        # Delete the file from bucket
        gsutil -m rm -r  gs://PREFIX_NAME-offboarding-bucket/$customer_name.txt
        echo "Deleted file from bucket"
        done < offboard.txt
        while read name; do
        gcloud alpha builds triggers list --region=REGION_NAME --project PROJECTID  --format="value(name)" | grep $name >> off-file.txt
        if [ "$(cat off-file.txt)" ]; then
          echo "File is not empty."
          while read file_name; do
            if [[ $file_name == $name-multi-tenant-destroy-saas-trigger ]]; then
              echo "Trigger found run this trigger"
              # Perform some action if the character is found
              gcloud alpha builds triggers run $name-multi-tenant-destroy-saas-trigger --region=REGION_NAME --branch=$name --project PROJECTID
            fi
          done < off-file.txt
        else
          echo "File empty. Do nothing."
        fi
        done < offboard.txt
    else
        echo "File empty. Do nothing."
    fi
    
    # Rolling Update tenant script
    gsutil -m ls gs://PREFIX_NAME-rolling-update-bucket/| sed 's#.*\/\(.*\)\/$#\1#' > object.txt
    gsutil -m cp -r gs://PREFIX_NAME-rolling-update-bucket/ .
    
    if [ "$(ls -A PREFIX_NAME-rolling-update-bucket/)" ]; then
      echo "Folder is not empty. Perform some action."
      gcloud source repos clone APPREPONAME --project=PROJECTID
      cd APPREPONAME/
      git checkout _TERRAFORM_CODE_BRANCH_NAME
      cd ../

      src_dir="PREFIX_NAME-rolling-update-bucket"

      dst_dir="APPREPONAME"

      while read folder_name; do
      # Copy the folder from the source directory to the destination directory
      cp -r $src_dir/$folder_name/frontend.yaml $dst_dir/multi-tenant/namespaces/$folder_name/frontend.yaml
      done < object.txt

      cd APPREPONAME/
      git add .
      git config --global user.email "cron@example.com"
      git config --global user.name "cron job"
      git status
      git commit -m "All application updated"
      git push origin _TERRAFORM_CODE_BRANCH_NAME
      # Change Directory and delete the file
      cd ../

      while read folder_name; do
        # Copy the folder from the source directory to the destination directory
        gsutil -m rm -r  gs://PREFIX_NAME-rolling-update-bucket/$folder_name
        echo "Deleted folder from bucket"
      done < object.txt
    else
      echo "Folder is empty. Do nothing."
      # Do nothing if the folder is empty
    fi