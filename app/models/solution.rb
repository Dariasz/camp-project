class Solution < ApplicationRecord
  mount_uploader :answer, AnswerUploader

  #### Associations
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :task

  #### Validations
  validates :author_id,
            uniqueness: { scope: :task }
end
