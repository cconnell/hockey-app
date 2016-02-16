Rails.application.routes.draw do
 
devise_for :users
root 'users#index'

get '/users' => 'users#index'

post '/users/' => 'users#create'
get '/users/:id' => 'users#show'

get '/users/:id/edit' => 'users#edit'
patch '/users/:id/' => 'users#update'
delete '/users/:id' => 'users#destroy'


get '/favorite_players' => 'favorite_players#index'
get '/favorite_players/new' => 'favorite_players#new'
post '/favorite_players' => 'favorite_players#create'
delete '/favorite_players' => 'favorite_players#destroy'

get '/favorite_players/id' => 'favorite_players#show'
get '/favorite_players/:id/edit' => 'favorite_players#edit'

get '/favorite_teams' => 'favorite_teams#index'
get '/favorite_teams/new' => 'favorite_teams#new'
post '/favorite_teams' => 'favorite_teams#create'
delete '/favorite_teams' => 'favorite_teams#destroy'

get '/favorite_teams/id' => 'favorite_teams#show'
get '/favorite_teams/:id/edit' => 'favorite_teams#edit'

get '/favorite_searches' => 'favorite_searches#index'
get '/favorite_searches/new' => 'favorite_searches#new'
post '/favorite_searches' => 'favorite_searches#create'
delete '/favorite_searches' => 'favorite_searches#destroy'

get '/favorite_searches/id' => 'favorite_searches#show'
get '/favorite_searches/:id/edit' => 'favorite_searches#edit'

end