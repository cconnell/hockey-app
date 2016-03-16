(function() {
  "use strict";

  angular.module("app").controller("statsCtrl", function($scope){
    $scope.message = "Test Message Working!!!"

    $scope.players_array = [{"id":8471214,"data":"1, WSH, L, A. Ovechkin, 66, 41, 21, 62"},{"id":8474141,"data":"2, CHI, R, P. Kane, 70, 38, 51, 89"},{"id":8473994,"data":"3, DAL, L, J. Benn, 70, 34, 43, 77"},{"id":8473419,"data":"4, BOS, L, B. Marchand, 65, 34, 20, 54"},{"id":8475794,"data":"5, DAL, C, T. Seguin, 70, 33, 39, 72"},{"id":8475765,"data":"6, STL, R, V. Tarasenko, 69, 33, 28, 61"},{"id":8470794,"data":"7, SJS, C, J. Pavelski, 68, 32, 34, 66"},{"id":8474564,"data":"8, TBL, C, S. Stamkos, 69, 31, 24, 55"},{"id":8471675,"data":"9, PIT, C, S. Crosby, 67, 29, 40, 69"},{"id":8475168,"data":"10, COL, C, M. Duchene, 70, 29, 26, 55"},{"id":8470621,"data":"11, ANA, R, C. Perry, 68, 29, 21, 50"},{"id":8470638,"data":"12, BOS, C, P. Bergeron, 68, 28, 33, 61"},{"id":8469455,"data":"13, DAL, C, J. Spezza, 64, 28, 25, 53"},{"id":8476887,"data":"14, NSH, L, F. Forsberg, 70, 28, 24, 52"},{"id":8471215,"data":"15, PIT, C, E. Malkin, 57, 27, 31, 58"},{"id":8476346,"data":"16, CGY, L, J. Gaudreau, 68, 26, 43, 69"},{"id":8467875,"data":"17, VAN, L, D. Sedin, 68, 26, 31, 57"},{"id":8475166,"data":"18, NYI, C, J. Tavares, 64, 26, 29, 55"},{"id":8470626,"data":"19, BOS, R, L. Eriksson, 70, 26, 27, 53"},{"id":8471707,"data":"20, NSH, R, J. Neal, 70, 26, 18, 44"},{"id":8470613,"data":"21, SJS, D, B. Burns, 68, 25, 37, 62"},{"id":8478550,"data":"22, CHI, L, A. Panarin, 68, 25, 37, 62"},{"id":8476453,"data":"23, TBL, R, N. Kucherov, 67, 25, 30, 55"},{"id":8473544,"data":"24, NYR, C, D. Brassard, 67, 25, 26, 51"},{"id":8474884,"data":"25, OTT, L, M. Hoffman, 66, 25, 22, 47"},{"id":8475726,"data":"26, LAK, C, T. Toffoli, 68, 25, 22, 47"},{"id":8476851,"data":"27, MTL, C, A. Galchenyuk, 69, 25, 21, 46"},{"id":8475151,"data":"28, NJD, R, K. Palmieri, 70, 25, 20, 45"},{"id":8475784,"data":"29, CAR, L, J. Skinner, 69, 25, 18, 43"},{"id":8474157,"data":"30, MTL, L, M. Pacioretty, 69, 24, 27, 51"}];

    $scope.addFavoritePlayer = function(player){
      $scope.players_array.push(player);
    };
    
    window.scope = $scope;
  });

}());

addFavoritePlayer(newFavoritePlayer)