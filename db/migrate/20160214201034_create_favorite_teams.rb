class CreateFavoriteTeams < ActiveRecord::Migration
  def change
    create_table :favorite_teams do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end
