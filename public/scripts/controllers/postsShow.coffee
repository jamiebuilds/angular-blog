angular.module('blog').controller 'postsShow', ['$scope', '$routeParams', 'Posts', ($scope, $routeParams, Posts) ->
  $scope.post = Posts.get(id: $routeParams.id)
]
