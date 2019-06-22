class AddUserIdToBoards < ActiveRecord::Migration[5.2]
  def change
    add_column :boards, :user_id, :integer
  end
end
