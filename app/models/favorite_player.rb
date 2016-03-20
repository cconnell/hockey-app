class FavoritePlayer < ActiveRecord::Base
  belongs_to :user
  validates :user_id, uniqueness: { scope: :player}
end
