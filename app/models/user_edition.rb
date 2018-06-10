class UserEdition < ApplicationRecord
  include UserRole

  #### Associations
  belongs_to :user
  belongs_to :edition

  #### Enums
  enum role: ROLES

  def name
    user.name
  end
end
