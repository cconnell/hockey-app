class FavoriteTeamsController < ApplicationController

def new
    @favteam = FavoriteTeam.new
  end

  def create
    @favteam = FavoriteTeam.new(user_id: current_user.id, team: params[:team])
    @favteam.save
  end


end
