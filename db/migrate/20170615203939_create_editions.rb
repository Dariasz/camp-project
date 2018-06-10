class CreateEditions < ActiveRecord::Migration[5.0]
  def change
    create_table :editions do |t|
      t.string :name
      t.datetime :edition_start
      t.datetime :edition_end
      t.datetime :recruitment_deadline
      t.datetime :camp_start
      t.datetime :camp_end
      t.string :camp_place

      t.timestamps
    end
  end
end
