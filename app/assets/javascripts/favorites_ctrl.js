(function() {
  "use strict";

  angular.module("app").controller("favoritesCtrl", function($scope, $http){
    $scope.setup = function(){
      $scope.user_id = jQuery("[data-user-id]").attr("data-user-id");
      $http.get('api/v2/favorites.json?user_id=' + $scope.user_id).then(function(response){

        $scope.favorites = response.data;
      });
      
    };

      window.scope = $scope;
  });

}());