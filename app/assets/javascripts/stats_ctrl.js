(function() {
  "use strict";

  angular.module("app").controller("statsCtrl", function($scope,$http){
    $scope.message = "Test Message Working!!!"

    $scope.setup = function(){
      $http.get('/api/v1/stats.json').then(function(response){
        $scope.players_api_array = (response.data);
      });
    };

    $scope.addFavoritePlayer = function(player){
      $scope.players_array.push(player);
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