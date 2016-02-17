class FavoritePlayersController < ApplicationController

  def new
    @favplayer = FavoritePlayer.new
  end

  def create
    @favorite_player = FavoritePlayer.new(user_id: current_user.id, player: params[:player])
    @favorite_player.save
    redirect_to "/"
    flash[:alert] = "Player saved to your favorites."

  end

  def destroy
    favorite_player = FavoritePlayer.find(params[:id])
    favorite_player.destroy
    redirect_to '/'
  end

end
