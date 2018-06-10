class Activity < ApplicationRecord

  scope :confirmed, -> { where(confirmed: true) }

  ## Associations
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :user_activities
  has_many :users, through: :user_activities
  has_many :events, dependent: :destroy
  has_many :activity_attachments, inverse_of: :activity, dependent: :destroy

  accepts_nested_attributes_for :activity_attachments

  enum group: %i[olympic academic miscellaneous]
  enum category: %i[algebra geometry number_theory combinatorics other]

  ### Validations
  validates :title,
            presence: true

end