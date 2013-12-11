angular.module('blog').controller 'LogoutCtrl', ['$scope', '$http', '$location', ($scope, $http, $location) ->
  $scope.submit = ->
    $http.get('/api/logout').success ->
      $location.path '/'
]
