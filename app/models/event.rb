class Event < ApplicationRecord
  include HasColor
  include IsProperty

  #### Associations
  belongs_to :activity
  belongs_to :edition
  has_many :feedbacks, dependent: :destroy
  has_many :users, through: :feedbacks

  #### Callbacks
  before_save :set_color

  ### Validations
  validates :title,
    presence: true
  validate :ends_after_starts?

  #### Methods
  def ends_after_starts?
    errors.add :ends_at,(t('errors.end_date_after_start_date')) if ends_at < starts_at
  end

  def during_day?(day)
    (starts_at.to_date..ends_at.to_date).include?(day)
  end
end
