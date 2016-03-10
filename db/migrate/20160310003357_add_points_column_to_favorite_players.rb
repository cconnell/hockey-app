class AddPointsColumnToFavoritePlayers < ActiveRecord::Migration
  def change
    add_column :favorite_players, :points, :integer
  end
end
