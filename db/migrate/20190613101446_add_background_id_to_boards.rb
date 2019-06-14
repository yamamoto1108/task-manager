class AddBackgroundIdToBoards < ActiveRecord::Migration[5.2]
  def change
    add_column :boards, :background_id, :integer
  end
end
