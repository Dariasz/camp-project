class Feedback < ApplicationRecord
  #### Associations
  belongs_to :user
  belongs_to :event

  #### Validates
  validates :mark,
            presence: true
end
