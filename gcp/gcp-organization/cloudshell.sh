#!/bin/bash

print_success() {
  echo -e "\e[32mSuccess\e[0m"
}
print_fail() {
  echo -e "\e[31mFail\e[0m"
}

org_ids=("123123123")



# display dig bash banner at the start
wget -qO - https://onboarding.dig.security/gcp/deployment-manager/banner.txt;


for org_id in "${org_ids[@]}"; do

  echo -e "\n------ dig security roles for organization ""$org_id""------"

    value=$(gcloud iam roles create role_dig_use1_collector1_b968dce --organization="$org_id" --stage=ga --description="IAM role used by dig-security - 23" 2>&1)
    if [[ $value == *"already exists"* ]]; then
      echo "Role role_dig_use1_collector1_b968dce Already exists, ignoring."
    else
      echo "$value"
    fi
    gcloud iam roles undelete role_dig_use1_collector1_b968dce --organization="$org_id" --verbosity=none

    value=$(gcloud iam roles create role_dig_use1_scanner1_b968dce --organization="$org_id" --stage=ga --description="IAM role used by dig-security - 23" 2>&1)
    if [[ $value == *"already exists"* ]]; then
      echo "Role role_dig_use1_scanner1_b968dce Already exists, ignoring."
    else
      echo "$value"
    fi
    gcloud iam roles undelete role_dig_use1_scanner1_b968dce --organization="$org_id" --verbosity=none

    value=$(gcloud iam roles create role_dig_use1_scanner2_b968dce --organization="$org_id" --stage=ga --description="IAM role used by dig-security - 23" 2>&1)
    if [[ $value == *"already exists"* ]]; then
      echo "Role role_dig_use1_scanner2_b968dce Already exists, ignoring."
    else
      echo "$value"
    fi
    gcloud iam roles undelete role_dig_use1_scanner2_b968dce --organization="$org_id" --verbosity=none

    value=$(gcloud iam roles create role_dig_use1_scanner3_b968dce --organization="$org_id" --stage=ga --description="IAM role used by dig-security - 23" 2>&1)
    if [[ $value == *"already exists"* ]]; then
      echo "Role role_dig_use1_scanner3_b968dce Already exists, ignoring."
    else
      echo "$value"
    fi
    gcloud iam roles undelete role_dig_use1_scanner3_b968dce --organization="$org_id" --verbosity=none

    value=$(gcloud iam roles create role_dig_use1_readonly1_b968dce --organization="$org_id" --stage=ga --description="IAM role used by dig-security - 23" 2>&1)
    if [[ $value == *"already exists"* ]]; then
      echo "Role role_dig_use1_readonly1_b968dce Already exists, ignoring."
    else
      echo "$value"
    fi
    gcloud iam roles undelete role_dig_use1_readonly1_b968dce --organization="$org_id" --verbosity=none


  echo -e "\n------ dig security role permissions for organization ""$org_id""------"

    gcloud iam roles update role_dig_use1_collector1_b968dce --organization="$org_id" --stage=ga --permissions=cloudsql.backupRuns.get,compute.snapshots.useReadOnly,bigquery.bireservations.get,bigquery.capacityCommitments.get,bigquery.capacityCommitments.list,bigquery.config.get,bigquery.datasets.get,bigquery.datasets.getIamPolicy,bigquery.models.getData,bigquery.models.getMetadata,bigquery.models.list,bigquery.routines.get,bigquery.routines.list,bigquery.tables.export,bigquery.tables.get,bigquery.tables.getData,bigquery.tables.getIamPolicy,bigquery.tables.list,bigtable.backups.restore --quiet
    gcloud iam roles update role_dig_use1_scanner1_b968dce --organization="$org_id" --stage=ga --permissions=bigtable.backups.create,bigtable.backups.delete,cloudsql.backupRuns.create,cloudsql.backupRuns.delete,compute.disks.createSnapshot,compute.snapshots.create,compute.snapshots.setLabels,storage.objects.get,storage.objects.list --quiet
    gcloud iam roles update role_dig_use1_scanner2_b968dce --organization="$org_id" --stage=ga --permissions=storage.objects.update,storage.objects.create,storage.multipartUploads.create,storage.multipartUploads.abort,storage.buckets.setIamPolicy,storage.buckets.create,storage.buckets.update,storage.buckets.delete,storage.multipartUploads.list,storage.multipartUploads.listParts,storage.objects.delete,compute.snapshots.delete --quiet
    gcloud iam roles update role_dig_use1_scanner3_b968dce --organization="$org_id" --stage=ga --permissions=cloudkms.cryptoKeyVersions.get,cloudkms.cryptoKeyVersions.useToDecrypt,cloudkms.cryptoKeyVersions.useToEncrypt --quiet
    gcloud iam roles update role_dig_use1_readonly1_b968dce --organization="$org_id" --stage=ga --permissions=resourcemanager.projects.get,aiplatform.endpoints.getIamPolicy,bigquery.connections.getIamPolicy,bigquery.dataPolicies.getIamPolicy,bigquery.datasets.getIamPolicy,bigquery.rowAccessPolicies.getIamPolicy,bigquery.tables.getIamPolicy,bigtable.backups.getIamPolicy,bigtable.instances.getIamPolicy,bigtable.tables.getIamPolicy,cloudkms.cryptoKeys.getIamPolicy,cloudkms.ekmConnections.getIamPolicy,cloudkms.importJobs.getIamPolicy,cloudkms.keyRings.getIamPolicy,compute.backendBuckets.getIamPolicy,compute.backendServices.getIamPolicy,compute.disks.getIamPolicy,compute.disks.get,compute.instances.get,compute.firewallPolicies.getIamPolicy,compute.globalOperations.getIamPolicy,compute.images.getIamPolicy,compute.instances.getIamPolicy,compute.networkEndpointGroups.getIamPolicy,compute.securityPolicies.getIamPolicy,compute.serviceAttachments.getIamPolicy,compute.snapshots.getIamPolicy,compute.subnetworks.getIamPolicy,compute.zoneOperations.getIamPolicy,connectors.connections.getIamPolicy,iam.serviceAccounts.getIamPolicy,pubsub.subscriptions.getIamPolicy,pubsub.topics.getIamPolicy,resourcemanager.projects.getIamPolicy,run.jobs.getIamPolicy,run.services.getIamPolicy,secretmanager.secrets.getIamPolicy,spanner.backups.getIamPolicy,spanner.databases.getIamPolicy,spanner.instances.getIamPolicy,storage.buckets.getIamPolicy,storage.objects.getIamPolicy,firebaserules.releases.get,firebaserules.releases.getExecutable,firebaserules.releases.list,firebaserules.rulesets.get,firebaserules.rulesets.list --quiet


  echo -e "\n------ dig security organization roles binding for ""$org_id""------"

  gcloud organizations add-iam-policy-binding "$org_id" \
  --member="serviceAccount:dig-use1-readonly-b0879f5@sa-demo-staging-prod-app-1.iam.gserviceaccount.com" \
  --role="roles/iam.organizationRoleViewer" \
  --condition="None" > /dev/null
done



  
  cloud_provider_id=123123123
  organization_id="$cloud_provider_id"

  echo -e "\n------ dig security logging-sink ------"

  value=$(gcloud logging sinks create dig-use1-sink-b968dce-123123123 \
  "pubsub.googleapis.com/projects/dig-security/topics/prod-use1-gcp-data-aggregator-messaging-customer-events" \
  --description="Used by dig-security (DDR) - 23" \
  --include-children \
  --log-filter="logName=organizations/123123123/logs/cloudaudit.googleapis.com%2Factivity" \
  --organization=123123123 2>&1)
  if [[ $value == *"already exists"* ]]; then
    echo "Sink dig-use1-sink-b968dce-123123123 Already exists, ignoring."
  else
    echo "$value"
  fi

  echo -e "\n------ dig security IAM bindings ------"

  gcloud organizations add-iam-policy-binding 123123123 \
  --member="serviceAccount:dig-use1-scanner-b0879f5@sa-demo-staging-prod-app-1.iam.gserviceaccount.com" \
  --role="roles/logging.admin" \
  --condition="expression=resource.name.startsWith(\"organizations/123123123/sinks/dig-use1-sink-b968dce-123123123\"),title=restrict_to_dig_sink" > /dev/null

  gcloud organizations add-iam-policy-binding 123123123 \
  --member="serviceAccount:dig-use1-scanner-b0879f5@sa-demo-staging-prod-app-1.iam.gserviceaccount.com" \
  --role="organizations/""$organization_id""/roles/role_dig_use1_scanner1_b968dce" \
  --condition="None" > /dev/null

  gcloud organizations add-iam-policy-binding 123123123 \
  --member="serviceAccount:dig-use1-scanner-b0879f5@sa-demo-staging-prod-app-1.iam.gserviceaccount.com" \
  --role="organizations/""$organization_id""/roles/role_dig_use1_scanner2_b968dce" \
  --condition="expression=resource.name.startsWith(\"projects/_/buckets/dig\")||resource.name.extract(\"/snapshots/{name}\").startsWith(\"dig-\"),title=restrict_to_dig_resources_scanner2" > /dev/null

  gcloud organizations add-iam-policy-binding 123123123 \
  --member="serviceAccount:dig-use1-scanner-b0879f5@sa-demo-staging-prod-app-1.iam.gserviceaccount.com" \
  --role="organizations/""$organization_id""/roles/role_dig_use1_scanner3_b968dce" \
  --condition="expression=resource.name.extract(\"/keyRings/{name}\").startsWith(\"dig-\"),title=restrict_to_dig_resources_scanner3" > /dev/null

  gcloud organizations add-iam-policy-binding 123123123 \
  --member="serviceAccount:dig-use1-scanner-b0879f5@sa-demo-staging-prod-app-1.iam.gserviceaccount.com" \
  --role="roles/viewer" \
  --condition="None" > /dev/null

  gcloud organizations add-iam-policy-binding 123123123 \
  --member="serviceAccount:dig-use1-orchestrator-b0879f5@sa-demo-staging-prod-app-1.iam.gserviceaccount.com" \
  --role="organizations/""$organization_id""/roles/role_dig_use1_collector1_b968dce" \
  --condition="None" > /dev/null

  gcloud organizations add-iam-policy-binding 123123123 \
  --member="serviceAccount:dig-use1-readonly-b0879f5@sa-demo-staging-prod-app-1.iam.gserviceaccount.com" \
  --role="organizations/""$organization_id""/roles/role_dig_use1_readonly1_b968dce" \
  --condition="None" > /dev/null

  gcloud organizations add-iam-policy-binding 123123123 \
  --member="serviceAccount:dig-use1-readonly-b0879f5@sa-demo-staging-prod-app-1.iam.gserviceaccount.com" \
  --role="roles/viewer" \
  --condition="None" > /dev/null

  gcloud organizations add-iam-policy-binding 123123123 \
  --member="serviceAccount:dig-use1-readonly-b0879f5@sa-demo-staging-prod-app-1.iam.gserviceaccount.com" \
  --role="roles/browser" \
  --condition="None" > /dev/null


  status_code=$(curl -o /dev/null -s -w "%{http_code}\n" --retry 9 --retry-max-time 300 --retry-all-errors -X PUT 'https://onboarding.use1.dig.security/onboarding/companies/1075559712458155008/cloud-account-groups' --header 'Content-Type: application/json' \
  -d '{"orchestratorProjectId": "sa-demo-staging-prod-app-1", "cloudProvider":"GCP", "onboardingScriptVersion":"23", "cloudProviderId":"123123123", "type":"ORGANIZATION", "sinkId": "organizations/123123123/sinks/dig-use1-sink-b968dce-123123123"}')

  if [[ $status_code -ge 200 && $status_code -lt 300 ]]; then
    print_success
  else
    print_fail
  fi

  curl -s -X POST --data "@log932f3c1b56257ce8539ac269d7aab42550dacf8818d075f0bdf1990562aae3ef.txt" 'https://onboarding.use1.dig.security/notification/logs'
