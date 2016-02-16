class AddSearchToFavoriteSearches < ActiveRecord::Migration
  def change
    add_column :favorite_searches, :team, :string
  end
end
