class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.string :name, null: false
      t.references :board, foreign_key: true

      t.timestamps
    end
  end
end
