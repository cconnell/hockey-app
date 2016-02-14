class AddTeamToFavoriteTeam < ActiveRecord::Migration
  def change
    add_column :favorite_teams, :team, :integer
  end
end
