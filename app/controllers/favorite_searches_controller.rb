class FavoriteSearchesController < ApplicationController
 def new
    @favsearch = FavoriteSearch.new
  end

  def create
    @favsearch = FavoriteSearch.new(user_id: current_user.id, search: params[:search])
    @favsearch.save
    redirect_to "/"
    flash[:alert] = "Search saved to your favorites."

  end

end

