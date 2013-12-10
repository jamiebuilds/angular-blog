angular.module('blog').controller 'postsEdit', ['$scope', '$routeParams', 'Posts', ($scope, $routeParams, Posts) ->
  $scope.post = Posts.get(id: $routeParams.id)
]
