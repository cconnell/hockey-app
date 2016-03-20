class Api::V2::FavoritesController < ApplicationController
  def index
    @favorites = FavoritePlayer.all
  end
end
