json.array! @favorites do |favorite|
  json.id favorite.user_id
  json.player favorite.player
  json.player_name favorite.player_name
  json.player_points favorite.player_points
end