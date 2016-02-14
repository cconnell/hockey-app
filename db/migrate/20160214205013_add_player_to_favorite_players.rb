class AddPlayerToFavoritePlayers < ActiveRecord::Migration
  def change
    add_column :favorite_players, :player, :integer
  end
end
