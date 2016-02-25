class UsersController < ApplicationController

  def index
    @user = current_user

    @requested_stats = Unirest.get("http://nhlwc.cdnak.neulion.com/fs1/nhl/league/leagueleaders/iphone/goals/leagueleaders.json").body

    # if @goals
    # @requested_stats = Unirest.get("http://nhlwc.cdnak.neulion.com/fs1/nhl/league/leagueleaders/iphone/goals/leagueleaders.json").body
    
    # else @points 
    # @requested_stats = Unirest.get("http://nhlwc.cdnak.neulion.com/fs1/nhl/league/leagueleaders/iphone/points/leagueleaders.json").body
    
    # @stats = @requested_stats.games_played
    @requested_stats_players = @requested_stats["skaterData"]
    @requested_stats_updated = @requested_stats["timestamp"]
    @requested_stats_table_title = @requested_stats["title"].titleize
    @requested_stats_table_categories = @requested_stats["categories"]

    @players_array = []
    @requested_stats_players
    @requested_stats_players.each do |info|
      new_hash = {}

      new_hash[:player_team] = info['data'].split(', ')[1]
      new_hash[:player_position] = info['data'].split(', ')[2]
      new_hash[:player_name] = info['data'].split(', ')[3]
      new_hash[:player_games] = info['data'].split(', ')[4].to_i
      new_hash[:player_goals] = info['data'].split(', ')[5].to_i
      new_hash[:player_assists] = info['data'].split(', ')[6].to_i
      new_hash[:player_points] = info['data'].split(', ')[7].to_i

      @players_array << new_hash
      # result = new_hash.sort { |x, y| x[7] <=> y[7] }
      # result

    end
  @players_array.sort! { |x,y| x[:player_name] <=> y[:player_name] } 
  

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
