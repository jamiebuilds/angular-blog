angular.module('blog').config ['$routeProvider', '$locationProvider', ($routeProvider, $locationProvider) ->
  $locationProvider.html5Mode true

  $routeProvider
    .when '/login',
      templateUrl : 'LoginTmpl'
      controller  : 'LoginCtrl'

    .when '/logout',
      templateUrl : 'LogoutTmpl'
      controller  : 'LogoutCtrl'

    .when '/posts',
      templateUrl : 'PostsIndexTmpl'
      controller  : 'PostsIndexCtrl'

    .when '/posts/new',
      templateUrl : 'PostsNewTmpl'
      controller  : 'PostsNewCtrl'

    .when '/posts/:id',
      templateUrl : 'PostsShowTmpl'
      controller  : 'PostsShowCtrl'

    .when '/posts/:id/edit',
      templateUrl : 'PostsEditTmpl'
      controller  : 'PostsEditCtrl'

    .when '/account',
      templateUrl : 'UsersShowTmpl'
      controller  : 'UsersShowCtrl'

    .when '/account/edit',
      templateUrl : 'UsersEditTmpl'
      controller  : 'UsersEditCtrl'

    .when '/account/new',
      templateUrl : 'UsersNewTmpl'
      controller  : 'UsersNewCtrl'

    .otherwise
      redirectTo  : '/posts'
]
