angular.module('blog').controller 'postsEdit', ['$scope', '$routeParams', '$location', 'Posts', ($scope, $routeParams, $location, Posts) ->
  $scope.post = Posts.get id: $routeParams.id

  $scope.submit = ->
    $scope.post.$save id: $routeParams.id, ->
      $location.path "/posts/#{$routeParams.id}"
]
