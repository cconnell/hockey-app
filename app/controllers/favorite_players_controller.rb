class FavoritePlayersController < ApplicationController

  def new
    @favplayer = FavoritePlayer.new
  end

  def create
    @favplayer = FavoritePlayer.new(user_id: current_user.id, player: params[:player])
    @favplayer.save
    redirect_to "/"
    flash[:alert] = "Player saved to your favorites."

  end

end
