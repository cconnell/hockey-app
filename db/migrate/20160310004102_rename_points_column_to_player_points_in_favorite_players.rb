class RenamePointsColumnToPlayerPointsInFavoritePlayers < ActiveRecord::Migration
  def change
    rename_column :favorite_players, :points, :player_points
  end
end
