angular.module('blog').controller 'postsIndex', ['$scope', 'Posts', ($scope, Posts) ->
  $scope.posts = Posts.query()
]
