angular.module('blog').controller 'postsNew', ['$scope', '$location', 'Posts', ($scope, $location, Posts) ->
  $scope.post = new Posts()

  $scope.submit = ->
    $scope.post.$save (post) ->
      $location.path "/posts/#{post._id}"
]
