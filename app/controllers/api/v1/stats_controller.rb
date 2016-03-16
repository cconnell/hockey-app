class Api::V1::StatsController < ApplicationController
  def index
    @nhl_json = Unirest.get("http://nhlwc.cdnak.neulion.com/fs1/nhl/league/leagueleaders/iphone/points/leagueleaders.json").body 

    @requested_stats_players = @nhl_json["skaterData"]
    @requested_stats_updated = @nhl_json["timestamp"]
    @requested_stats_table_title = @nhl_json["title"].titleize

    @players_array_ajax = []
    
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

        @players_array_ajax << temp_hash
      end
  end
end


# <h1><%= @requested_stats_table_title %> Leaders</h1>
# <h5>Current as of: <%= @requested_stats_updated %></h5>