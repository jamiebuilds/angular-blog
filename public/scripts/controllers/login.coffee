angular.module('blog').controller 'LoginCtrl', ['$scope', '$location', '$http', ($scope, $location, $http) ->
  $scope.user =
    email    : ''
    password : ''

  $scope.submit = ->
    $http.post('/api/login', $scope.user).success (user) ->
      $location.path '/'
]
