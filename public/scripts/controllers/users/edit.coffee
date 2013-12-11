angular.module('blog').controller 'UsersEditCtrl', ['$scope', '$location', 'UsersService', ($scope, $location, UsersService) ->
  $scope.user = UsersService.get path: 'me'

  $scope.submit = ->
    $scope.user.$save path: 'me', (user) ->
      $location.path '/account'
]
