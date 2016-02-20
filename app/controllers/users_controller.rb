class UsersController < ApplicationController

  def index
    @user = current_user
    @requested_stats = Unirest.get("http://nhlwc.cdnak.neulion.com/fs1/nhl/league/leagueleaders/iphone/goals/leagueleaders.json").body

    @requested_stats_players = @requested_stats["skaterData"]
    @requested_stats_updated = @requested_stats["timestamp"]
    @requested_stats_table_title = @requested_stats["title"].titleize
    @requested_stats_table_categories = @requested_stats["categories"]

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
