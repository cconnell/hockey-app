Rails.application.routes.draw do
 
  

  get 'checker/index'

# get 'stats/index'

devise_for :users
root 'users#index'

namespace :api do
  namespace :v1 do
    get '/stats' => 'stats#index'
  end
end

namespace :api do
  namespace :v2 do
    get '/favorites' => 'favorites#index'
  end
end

get '/users' => 'users#index'
get '/users/table' => 'users#table'
post '/users/' => 'users#create'
get '/users/:id' => 'users#show'
get '/users/:id/edit' => 'users#edit'
patch '/users/:id/' => 'users#update'
delete '/users/:id' => 'users#destroy'

get '/checker' =>'checker#index'

get '/favorite_players' => 'favorite_players#index'


post '/favorite_players/' => 'favorite_players#create'
# get '/favorite_players/:id' => 'favorite_players#show'
delete '/favorite_players/' => 'favorite_players#destroy'


get '/favorite_teams' => 'favorite_teams#index'

post '/favorite_teams' => 'favorite_teams#create'
get '/favorite_teams/:id' => 'favorite_teams#show'
delete '/favorite_teams/:id' => 'favorite_teams#destroy'

get '/favorite_searches' => 'favorite_searches#index'

get '/favorite_searches/new' => 'favorite_searches#new'
post '/favorite_searches' => 'favorite_searches#create'
get '/favorite_searches/:id' => 'favorite_searches#show'
delete '/favorite_searches/:id' => 'favorite_searches#destroy'

end