class FavoritePlayersController < ApplicationController
  # authorize logged only if logged in
  def new
    @favplayer = FavoritePlayer.new
  end

  def create
    
    user = current_user

    @favorite_player = FavoritePlayer.new(player: params[:player], player_points: params[:player_points], player_name: params[:player_name] )
    # verify_favorite = FavoritePlayer.where(user_id: current_user.id).where(player: params[:id])
    
    # if verify_favorite.empty?
      @favorite_player.save
    #   flash[:alert] = "Player saved to your favorites."
    # else
    #   flash[:alert] = "Player already saved to your favorites."
    # end
    redirect_to "/"
    
  end

  def destroy
    favorite_player = FavoritePlayer.find(params[:id])
    favorite_player.destroy
    redirect_to '/'
  end

  # def check
   
  # saved_stat = FavoritePlayer.where(player: player[:id])

  # if saved_stat.player_points < new points
  #   saved_stat.player_points == new points
  #   saved_stat.player_points.save
  # end


# their_weactions = Weaction.where(user_id: @post.user_id).where(match: true)


end
