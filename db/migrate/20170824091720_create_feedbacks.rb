class CreateFeedbacks < ActiveRecord::Migration[5.0]
  def change
    create_table :feedbacks do |t|
      t.references :event
      t.references :user
      t.decimal :mark
      t.text :comment
      t.timestamps
    end
  end
end
