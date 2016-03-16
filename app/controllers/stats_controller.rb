class StatsController < ApplicationController
  def index
    @players_raw_json = Unirest.get("http://nhlwc.cdnak.neulion.com/fs1/nhl/league/leagueleaders/iphone/goals/leagueleaders.json").body
  end
end
