class UsersController < ApplicationController

  def index
    @user = User.first
    @goal_league_leaders = Unirest.get("http://nhlwc.cdnak.neulion.com/fs1/nhl/league/leagueleaders/iphone/goals/leagueleaders.json").body

    @goals = @goal_league_leaders["skaterData"]
    @updated = @goal_league_leaders["timestamp"]

  end

  def show

  end

  def update
    @user = User.find(params[:id])

    @user.update ({
                favorite_player: params[:favorite_player]
      })
  end

  def edit
    @user = User.find(params[:id])
  end
   
end
