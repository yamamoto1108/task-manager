class AddRowOrderToLists < ActiveRecord::Migration[5.2]
  def change
    add_column :lists, :row_order, :integer
  end
end
