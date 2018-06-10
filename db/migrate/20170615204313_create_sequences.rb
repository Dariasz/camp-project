class CreateSequences < ActiveRecord::Migration[5.0]
  def change
    create_table :sequences do |t|
      t.string :name
      t.string :content
      t.datetime :sequence_start
      t.datetime :sequence_end
      t.references :edition, index: true

      t.timestamps
    end
  end
end
