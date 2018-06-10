class CreateUserActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :user_activities do |t|
      t.references :activity
      t.references :user

      t.timestamps
    end
  end
end
