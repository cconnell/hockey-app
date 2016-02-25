class UsersController < ApplicationController

  def index
    @user = current_user
 
    @requested_stats = Unirest.get("http://nhlwc.cdnak.neulion.com/fs1/nhl/league/leagueleaders/iphone/assists/leagueleaders.json").body

    # if params[:goal_leaders]
    #   @requested_stats = Unirest.get("http://nhlwc.cdnak.neulion.com/fs1/nhl/league/leagueleaders/iphone/goals/leagueleaders.json").body
    #   render :index
    # elsif params[:point_leaders]
    #   @requested_stats = Unirest.get("http://nhlwc.cdnak.neulion.com/fs1/nhl/league/leagueleaders/iphone/points/leagueleaders.json").body
    #   render :index
    # elsif params[:assist_leaders]
    #   @requested_stats = Unirest.get("http://nhlwc.cdnak.neulion.com/fs1/nhl/league/leagueleaders/iphone/assists/leagueleaders.json").body
    #   render :index
      
    end

    @requested_stats_players = @requested_stats["skaterData"]
    @requested_stats_updated = @requested_stats["timestamp"]
    @requested_stats_table_title = @requested_stats["title"].titleize

    @players_array = []
    
      @requested_stats_players.each do |info|
        temp_hash = {}

        temp_hash[:player_team] = info['data'].split(', ')[1]
        temp_hash[:player_position] = info['data'].split(', ')[2]
        temp_hash[:player_name] = info['data'].split(', ')[3]
        temp_hash[:player_games] = info['data'].split(', ')[4].to_i
        temp_hash[:player_goals] = info['data'].split(', ')[5].to_i
        temp_hash[:player_assists] = info['data'].split(', ')[6].to_i
        temp_hash[:player_points] = info['data'].split(', ')[7].to_i

        @players_array << temp_hash
      end
  
    if params[:team]
      @players_array = @players_array.sort! { |x,y| x[:player_team] <=> y[:player_team] } 
      render :index
    end

    if params[:position]
      @players_array = @players_array.sort! { |x,y| x[:player_position] <=> y[:player_position] } 
      render :index
    end
  
    if params[:name]
      @players_array = @players_array.sort! { |x,y| x[:player_name] <=> y[:player_name] } 
      render :index
    end

    if params[:games]
      @players_array = @players_array.sort! { |x,y| x[:player_games] <=> y[:player_games] } 
      render :index
    end

    if params[:goals]
      @players_array = @players_array.sort! { |x,y| x[:player_goals] <=> y[:player_goals] } 
      render :index
    end

    if params[:assists]
      @players_array = @players_array.sort! { |x,y| x[:player_assists] <=> y[:player_assists] } 
      render :index
    end

    if params[:points]
      @players_array = @players_array.sort! { |x,y| x[:player_points] <=> y[:player_points] } 
      render :index
    end

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
