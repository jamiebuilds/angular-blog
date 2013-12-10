angular.module('blog').factory 'Posts', ['$resource', ($resource) ->
  return $resource('/api/posts/:id', { id: '@id' }, { })
]
