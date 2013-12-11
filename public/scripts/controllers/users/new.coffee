angular.module('blog').controller 'UsersNewCtrl', ['$scope', '$http', '$location', 'UsersService', ($scope, $http, $location, UsersService) ->
  $scope.user = new UsersService()

  $scope.submit = ->
    $scope.user.$save (user) ->
      $http.post '/api/login', $scope.user, ->
        $location.path '/account'
]
