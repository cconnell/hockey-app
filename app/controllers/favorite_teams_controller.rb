class FavoriteTeamsController < ApplicationController

def new
    @favteam = FavoriteTeam.new
  end

  def create
    @favteam = FavoriteTeam.new(user_id: current_user.id, team: params[:team])
    @favteam.save
    redirect_to "/"
    flash[:alert] = "Team saved to your favorites."
  end

  def destroy
    favorite_team = Favoriteteam.find(params[:id])
    favorite_team.destroy
    redirect_to '/'
  end

end
