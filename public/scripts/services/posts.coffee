angular.module('blog').factory 'PostsService', ['$resource', ($resource) ->
  return $resource('/api/posts/:id', { id: '@id' }, { })
]
