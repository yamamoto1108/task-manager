class TeamUser < ApplicationRecord
  belongs_to :team
  belongs_to :user

  add_index :team_users, [:team_id, :user_id], unique: true
end
