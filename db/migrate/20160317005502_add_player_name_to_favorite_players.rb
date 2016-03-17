class AddPlayerNameToFavoritePlayers < ActiveRecord::Migration
  def change
    add_column :favorite_players, :player_name, :string
  end
end
