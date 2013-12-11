angular.module('blog').controller 'PostsEditCtrl', ['$scope', '$routeParams', '$location', 'PostsService', ($scope, $routeParams, $location, PostsService) ->
  $scope.post = PostsService.get id: $routeParams.id

  $scope.submit = ->
    $scope.post.$save id: $routeParams.id, ->
      $location.path "/posts/#{$routeParams.id}"
]
