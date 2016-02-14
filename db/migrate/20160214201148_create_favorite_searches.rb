class CreateFavoriteSearches < ActiveRecord::Migration
  def change
    create_table :favorite_searches do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end
