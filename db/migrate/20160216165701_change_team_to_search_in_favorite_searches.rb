class ChangeTeamToSearchInFavoriteSearches < ActiveRecord::Migration
  def change
    rename_column :favorite_searches, :team, :search
  end
end
