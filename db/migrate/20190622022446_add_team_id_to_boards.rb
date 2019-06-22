class AddTeamIdToBoards < ActiveRecord::Migration[5.2]
  def change
    add_column :boards, :team_id, :integer
  end
end
