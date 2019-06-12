class CreateBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :boards do |t|
      t.string :name, null: false
      t.text :about
      t.date :deadline, default: nil
      t.boolean :finish, default: false, null: false

      t.timestamps
    end
  end
end
