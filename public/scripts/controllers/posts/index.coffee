angular.module('blog').controller 'PostsIndexCtrl', ['$scope', 'PostsService', ($scope, PostsService) ->
  $scope.posts = PostsService.query()
]
