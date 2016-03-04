task :default => :update_stats
  desc "Testing!"
  task :call_nhl do
    stats =  Unirest.get("http://nhlwc.cdnak.neulion.com/fs1/nhl/league/leagueleaders/iphone/goals/leagueleaders.json").body
    p stats["timestamp"]
  end


