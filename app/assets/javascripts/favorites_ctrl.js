(function() {
  "use strict";

  angular.module("app").controller("favoritesCtrl", function($scope, $http){
  $scope.setup = function(){
    $http.get('api/v2/favorites.json').then(function(response){
      console.log(response);
    });

    };

    window.scope = $scope;
  });

}());