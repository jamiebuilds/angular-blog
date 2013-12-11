angular.module('blog').service 'AuthService', ['$http', ($http) ->
  login: (user) ->
    $http.post('/api/login', user)

  logout: (callback) ->
    $http.get('/api/logout')
]
