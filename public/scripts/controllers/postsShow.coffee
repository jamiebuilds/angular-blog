angular.module('blog').controller 'postsShow', ['$scope', '$routeParams', '$location', 'Posts', ($scope, $routeParams, $location, Posts) ->
  $scope.post = Posts.get id: $routeParams.id

  $scope.delete = ->
    $scope.post.$delete id: $routeParams.id, ->
      $location.path '/posts'
]
