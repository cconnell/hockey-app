class FavoritePlayer < ActiveRecord::Base
  belongs_to :user
  # validates :uniqueness => true
end
