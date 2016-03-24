class UsersController < ApplicationController
  before_action :authenticate_user!

  def table
  end
  def index
    @user = current_user
 
    # @requested_stats = Unirest.get("http://nhlwc.cdnak.neulion.com/fs1/nhl/league/leagueleaders/iphone/assists/leagueleaders.json").body

    # if params[:goal_leaders] || params[:stat_type] == 'goals'
    #   @requested_stats = Unirest.get("http://nhlwc.cdnak.neulion.com/fs1/nhl/league/leagueleaders/iphone/goals/leagueleaders.json").body
    #   @stat_type = 'goals'
      
    # elsif params[:point_leaders] || params[:stat_type] == 'points'
    #   @requested_stats = Unirest.get("http://nhlwc.cdnak.neulion.com/fs1/nhl/league/leagueleaders/iphone/points/leagueleaders.json").body
    #   @stat_type = 'points'
      
    # elsif params[:assist_leaders] || params[:stat_type] == 'assits'
    #   @requested_stats = Unirest.get("http://nhlwc.cdnak.neulion.com/fs1/nhl/league/leagueleaders/iphone/assists/leagueleaders.json").body
    #   @stat_type = 'assists'
      
    # elsif params[:team]

    # else 
      @requested_stats = Unirest.get("http://nhlwc.cdnak.neulion.com/fs1/nhl/league/leagueleaders/iphone/points/leagueleaders.json").body

      # @requested_stats = File.get("app/assets/leagueleaders.json").body 
    # end

  # @players_array = Stats.processed_hash(@requested_stats)

    # Unirest.get 
    # @players_array = Model.parse_stats(@requested_stats)
    # render json: @players_array

    @requested_stats_players = @requested_stats["skaterData"]
    @requested_stats_updated = @requested_stats["timestamp"]
    @requested_stats_table_title = @requested_stats["title"].titleize

    @players_array = []
    
      @requested_stats_players.each do |info|
        temp_hash = {}
        temp_hash[:id] = info['id']
        temp_hash[:player_team] = info['data'].split(', ')[1]
        temp_hash[:player_position] = info['data'].split(', ')[2]
        temp_hash[:player_name] = info['data'].split(', ')[3]
        temp_hash[:player_games] = info['data'].split(', ')[4].to_i
        temp_hash[:player_goals] = info['data'].split(', ')[5].to_i
        temp_hash[:player_assists] = info['data'].split(', ')[6].to_i
        temp_hash[:player_points] = info['data'].split(', ')[7].to_i

        @players_array << temp_hash
      end
         
    @score_alerts = []

    @players_array.each do |player|
      if FavoritePlayer.where(player: player[:id]).length >= 1
          favs = FavoritePlayer.where(player: player[:id])
          favs.each do |fav|
            # @scorealert = []
            
            if fav.player_points < player[:player_points]
              # fav.player_points = player[:player_points]
              # fav.save
              temp_alert_hash = {}
              temp_alert_hash[:id] = fav.id
              temp_alert_hash[:player_name] = fav.player_name
              temp_alert_hash[:alert] = fav.user_id
              temp_alert_hash[:player] = fav.player
              @score_alerts << temp_alert_hash

              
              # client = Hue::Client.new
              # light = client.lights[1]
              # light.off!
              # light.set_state({:alert => 'lselect'}) 
            end
          end
      end
    end


    
    # @players_array
    #  saved_stat = FavoritePlayer.where(player: player[:id])

  # if saved_stat.player_points < new points
  #   saved_stat.player_points == new points
  #   saved_stat.player_points.save
  


  # Must pass in leaders parameter with sort so there is something to sort!

  # Is it possible to make params universal so can have ONE if statement?

   # if params[:SEARCHTERM]
   #    @players_array = @players_array.sort! { |x,y| x[:SEARCHTERM] <=> y[:SEARCHTERM] } 
   #    render :index
   #  end

    # if params[:sort_by_team]
    #   @players_array = @players_array.sort! { |x,y| x[:player_team] <=> y[:player_team] } 
    #   render :index
    # end

    # if params[:sort_by_position]
    #   @players_array = @players_array.sort! { |x,y| x[:player_position] <=> y[:player_position] } 
    #   render :index
    # end
  
    # if params[:sort_by_name]
    #   @players_array = @players_array.sort! { |x,y| x[:player_name] <=> y[:player_name] } 
    #   render :index
    # end

    # if params[:sort_by_gamesplayed]
    #   @players_array = @players_array.sort! { |x,y| y[:player_games] <=> x[:player_games] } 
    #   render :index
    # end

    # if params[:sort_by_goals]
    #   @players_array = @players_array.sort! { |x,y| y[:player_goals] <=> x[:player_goals] } 
    #   render :index
    # end

    # if params[:sort_by_assists]
    #   @players_array = @players_array.sort! { |x,y| y[:player_assists] <=> x[:player_assists] } 
    #   render :index
    # end

    # if params[:sort_by_points]
    #   @players_array = @players_array.sort! { |x,y| y[:player_points] <=> x[:player_points] } 
    #   render :index
    # end

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

  private


   
end
