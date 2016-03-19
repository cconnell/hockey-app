class User < ActiveRecord::Base
  
  has_many :favorite_players
  has_many :favorite_teams
  has_many :favorite_searches
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def stats_updated
    requested_stats["timestamp"]
  end

  
end
