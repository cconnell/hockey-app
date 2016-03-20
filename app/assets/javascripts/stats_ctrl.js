(function() {
  "use strict";

  angular.module("app").controller("statsCtrl", function($scope,$http){
    // $scope.message = "Test Message Working!!!"

    $scope.setup = function(){
      $http.get('/api/v1/stats.json').then(function(response){
        $scope.players_api_array = (response.data);
      });
    };

    $scope.addFavoritePlayer = function(playerId, playerName, playerPoints, userId){
      var userId = user.getAttribute("data-user-id");
      console.log(playerId);
      
      var newFavoritePlayer = {
        player: playerId,
        player_name: playerName,
        player_points: playerPoints,
        user_id: userId
      };
      console.log(newFavoritePlayer);
      // favorite_players/{{player.id}}
      $http.post('/favorite_players/', newFavoritePlayer).then(function(response){
        console.log(response);
      });
    };
    
    $scope.dropFavoritePlayer = function(){
      $http.post('/favorite_players/', deleteFavoritePlayer).then(function(id){

        var deleteFavoritePlayer = {
          favorite_id: id
        }

      });
    };
    $scope.sortBy = function(sortAttribute){
      if (sortAttribute != $scope.sortByAttribute){

      } else {
        $scope.descending = !$scope.descending;
      }

      $scope.sortByAttribute = sortAttribute; 
    };

    window.scope = $scope;
  });

}());

// addFavoritePlayer(newFavoritePlayer)