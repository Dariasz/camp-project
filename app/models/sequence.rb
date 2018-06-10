class Sequence < ApplicationRecord
  mount_uploader :content, SequenceContentUploader


  #### Associations
  belongs_to :edition
  has_many :tasks
  has_many :solutions, through: :tasks

  #### Validates
  validates :name, :edition_id, :sequence_start, :sequence_end,
            presence: true
  validate :dates_order?

  #### Methods
  def sequence_full_name
    ["#{name}", " #{edition.name}"].join(', ')
  end

  def opened?
    time = DateTime.now
    time > sequence_start && time < sequence_end.end_of_day
  end

  def show_content?
    DateTime.now > sequence_start && content.present?
  end

  def dates_order?
    errors.add :sequence_end, (I18n.t('errors.sequence_end')) if sequence_start > sequence_end
  end

end
