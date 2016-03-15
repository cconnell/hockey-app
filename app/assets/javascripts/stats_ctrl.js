(function() {
  "use strict";

  angular.module("app").controller("statsCtrl", function($scope, $http){

    $scope.message = "hi"

    $scope.stats_json = $http.get("http://nhlwc.cdnak.neulion.com/fs1/nhl/league/leagueleaders/iphone/goals/leagueleaders.json")
    // render json: result
// {
// id: 8471214,
// data: "1, WSH, L, A. Ovechkin, 66, 41, 21, 62"
// },
// {
// id: 8474141,
// data: "2, CHI, R, P. Kane, 69, 38, 51, 89"
// },
// {
// id: 8473994,
// data: "3, DAL, L, J. Benn, 70, 34, 43, 77"
// },
// {
// id: 8473419,
// data: "4, BOS, L, B. Marchand, 65, 34, 20, 54"
// },
// {
// id: 8475794,
// data: "5, DAL, C, T. Seguin, 70, 33, 39, 72"
// },
// {
// id: 8475765,
// data: "6, STL, R, V. Tarasenko, 68, 33, 28, 61"
// }
// ]

// FIX TO WRITE TO DB *******************

  $scope.addFavoritePlayer = function(review){
    $scope.FAVORITEPLAYERS.push(review);
  };
// FIX TO WRITE TO DB *********************

    window.scope = $scope;
  });

}());