require 'angular'
require 'angular-route'
require 'angular-resource'
require 'jquery'
require '../components/bootstrap-stylus/js/collapse.js'
require '../components/bootstrap-stylus/js/transition.js'

angular.module 'blog', ['ngRoute', 'ngResource']

require './router.coffee'

require './filters/markdown.coffee'

require './services/auth.coffee'
require './services/posts.coffee'
require './services/users.coffee'

require './controllers/login.coffee'
require './controllers/logout.coffee'

require './controllers/posts/index.coffee'
require './controllers/posts/new.coffee'
require './controllers/posts/show.coffee'
require './controllers/posts/edit.coffee'

require './controllers/users/show.coffee'
require './controllers/users/new.coffee'
require './controllers/users/edit.coffee'
