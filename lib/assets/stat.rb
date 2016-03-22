class Stat 

  def league_leaders
    @requested_stats = Unirest.get("http://nhlwc.cdnak.neulion.com/fs1/nhl/league/leagueleaders/iphone/points/leagueleaders.json").body 

    @requested_stats_players = @requested_stats["skaterData"]
      @requested_stats_updated = @requested_stats["timestamp"]
      @requested_stats_table_title = @requested_stats["title"].titleize

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

  

  
    @players_array.each do |player|
      if FavoritePlayer.where(player: player[:id]).length >= 1
          favs = FavoritePlayer.where(player: player[:id])
          favs.each do |fav|
            # @scorealert = []
            
            if fav.player_points < player[:player_points]
              fav.player_points = player[:player_points]
              fav.save
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



end
