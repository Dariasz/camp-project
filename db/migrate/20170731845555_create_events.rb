class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :starts_at
      t.datetime :ends_at
      t.boolean :all_day
      t.text :description
      t.string :color
      t.string :category
      t.boolean :locked, default: true
      t.references :activity, index: true
      t.references :edition, index: true

      t.timestamps
    end
  end
end
