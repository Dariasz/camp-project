class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  include UserRole

  #### Devise configuration
  devise :database_authenticatable,
         :confirmable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable
  #:validatable

  #### Associations
  has_many :user_activities
  has_many :activities, through: :user_activities
  has_many :owned_activities, foreign_key: 'author_id'
  has_many :solutions, foreign_key: 'author_id'
  has_many :feedbacks
  has_many :events, through: :feedbacks
  has_many :user_edition
  has_many :editions, through: :user_edition

  #### Enums
  enum nationality: %i[PL CZ SK HU]
  enum role: ROLES

  #### Constants
  AVAILABLE_LOCALES = %w[PL EN].freeze

  #### Validates
  validates :first_name, :last_name,
            presence: true

  #### Callbacks
  before_create :set_locale

  # Override Devise::Confirmable#after_confirmation
  def after_confirmation
    mugol!
  end

  def set_locale
    locale = nationality.downcase if nationality.present?
  end

  def name
    [first_name, +last_name].join(' ')
  end

  def name_with_role
    [name, +" (#{role})"].join('')
  end

  def feedbacks_per_day(day)
    feedbacks.select { |feedback| feedback.event.during_day?(day) }.count
  end
end
