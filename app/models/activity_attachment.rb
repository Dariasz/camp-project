class ActivityAttachment < ApplicationRecord
  mount_uploader :handout, HandoutUploader

  #### Associations
  belongs_to :activity
end
