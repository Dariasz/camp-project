class UserActivity < ApplicationRecord
  #### Associations
  belongs_to :user
  belongs_to :activity
end
