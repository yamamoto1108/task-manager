class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :name, null: false
      t.text :about
      t.date :deadline, default: nil
      t.boolean :finish, default: false, null: false
      t.references :list, foreign_key: true

      t.timestamps
    end
  end
end
