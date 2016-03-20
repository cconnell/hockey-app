class Api::V2::FavoritesController < ApplicationController
  def index
    # user = User.find(params[:user_id])
    @favorites = FavoritePlayer.where(user_id: params[:user_id])
  end
end
