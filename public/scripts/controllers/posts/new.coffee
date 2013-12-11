angular.module('blog').controller 'PostsNewCtrl', ['$scope', '$location', 'PostsService', ($scope, $location, PostsService) ->
  $scope.post = new PostsService()

  $scope.submit = ->
    $scope.post.$save (post) ->
      $location.path "/posts/#{post._id}"
]
