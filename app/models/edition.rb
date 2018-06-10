class Edition < ApplicationRecord
  #### Associations
  has_many :sequences
  has_many :events
  has_many :user_editions
  has_many :users, through: :user_editions

  accepts_nested_attributes_for :user_editions

  #### Validates
  validates :name, :edition_start, :edition_end, :recruitment_deadline, :camp_start, :camp_end, :camp_place,
            presence: true
  validate :dates_order?

  #### Methods
  def recruitment?
    now = Time.now
    now > edition_start && now < recruitment_deadline.end_of_day
  end

  def applied?(user_id)
    users.exists?(user_id)
  end

  def can_apply?(user_id)
    recruitment? && !applied?(user_id)
  end

  def dates_order?
    errors.add :recruitment_deadline, (I18n.t('errors.recruitment_deadline')) if edition_start > recruitment_deadline
    errors.add :camp_start, (I18n.t('errors.camp_start')) if recruitment_deadline > camp_start
    errors.add :camp_end, (I18n.t('errors.camp_start')) if camp_start > camp_end
    errors.add :edition_end, (I18n.t('errors.edition_end')) if camp_end > edition_end
  end
end
