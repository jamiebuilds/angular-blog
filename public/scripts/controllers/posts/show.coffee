angular.module('blog').controller 'PostsShowCtrl', ['$scope', '$routeParams', '$location', 'PostsService', ($scope, $routeParams, $location, PostsService) ->
  $scope.post = PostsService.get id: $routeParams.id

  $scope.delete = ->
    $scope.post.$delete id: $routeParams.id, ->
      $location.path '/posts'
]
