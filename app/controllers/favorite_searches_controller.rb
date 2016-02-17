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


def destroy
    favorite_search = FavoriteSearch.find(params[:id])
    favorite_search.destroy
    redirect_to '/'
  end

end

