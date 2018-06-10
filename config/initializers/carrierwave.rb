CarrierWave.configure do |config|
  config.storage                             = :gcloud
  config.gcloud_bucket                       = 'mathsbeyondlimits'
  config.gcloud_bucket_is_public             = true
  config.gcloud_authenticated_url_expiration = 600

  config.gcloud_attributes = {
    expires: 600
  }

  config.gcloud_credentials = {
    gcloud_project: 'MBL2018',
    gcloud_keyfile: 'config/initializers/MBL2018-b5cd179d7c09.json'
  }

end
