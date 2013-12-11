angular.module('blog').controller 'UsersShowCtrl', ['$scope', 'UsersService', ($scope, UsersService) ->
  $scope.user = UsersService.get path: 'me'
]
