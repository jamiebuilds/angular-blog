angular.module('blog').config ['$routeProvider', '$locationProvider', ($routeProvider, $locationProvider) ->
  $locationProvider.html5Mode true

  $routeProvider
    .when '/posts',
      templateUrl : 'postsIndex'
      controller  : 'postsIndex'

    .when '/posts/new',
      templateUrl : 'postsNew'
      controller  : 'postsNew'

    .when '/posts/:id',
      templateUrl : 'postsShow'
      controller  : 'postsShow'

    .when '/posts/:id/edit',
      templateUrl : 'postsEdit'
      controller  : 'postsEdit'

    .otherwise
      redirectTo  : '/posts'
]
