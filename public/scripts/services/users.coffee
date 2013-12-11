angular.module('blog').factory 'UsersService', ['$resource', ($resource) ->
  return $resource('/api/users/:path', { path: '@path' }, { })
]
