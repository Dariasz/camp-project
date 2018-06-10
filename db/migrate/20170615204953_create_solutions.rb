class CreateSolutions < ActiveRecord::Migration[5.0]
  def change
    create_table :solutions do |t|
      t.references :author, index: true
      t.references :task, index: true
      t.text :answer
      t.decimal :mark

      t.timestamps
    end
  end
end
