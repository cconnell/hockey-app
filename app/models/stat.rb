class Stat < ActiveRecord::Base

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
end
