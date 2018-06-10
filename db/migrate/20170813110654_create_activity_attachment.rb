class CreateActivityAttachment < ActiveRecord::Migration[5.0]
  def change
    create_table :activity_attachments do |t|
      t.string :handout
      t.integer :activity_id
    end
  end
end
