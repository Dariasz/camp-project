class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.string :title, null: false
      t.text :description
      t.references :author, references: :user, index:true
      t.integer :group
      t.integer :category, null: false, default: 0
      t.integer :level
      t.integer :days
      t.boolean :confirmed, null: false, default: false ## delete it

      t.timestamps
    end
  end
end
