class CreateUserEditions < ActiveRecord::Migration[5.1]
  def change
    create_table :user_editions do |t|
      t.references :user
      t.integer :role
      t.references :edition
      
      t.timestamps
    end
  end
end
