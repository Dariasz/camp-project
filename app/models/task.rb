class Task < ApplicationRecord
  #### Associations
  belongs_to :sequence
  has_many :solutions

  accepts_nested_attributes_for :solutions
  #### Methods
  def edition
    sequence.edition
  end

  def full_task_name
    [edition.name, sequence.name, "Task #{name}"].join(', ')
  end

  def task_name_with_sequence
    [sequence.name, "Task #{name}"].join(', ')
  end

  def has_user?(user)
    solutions.map(&:author_id).include? user.id
  end
end
