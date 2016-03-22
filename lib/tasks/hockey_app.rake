task :default => :update_stats
  desc "refreshing_db"
  task :call_nhl do
    Unirest.get("http://localhost:3000/users")
  end


