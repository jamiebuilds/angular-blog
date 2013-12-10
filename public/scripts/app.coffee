require 'angular'
require 'angular-route'
require 'angular-resource'
require 'jquery'
require '../components/bootstrap-stylus/js/collapse.js'
require '../components/bootstrap-stylus/js/transition.js'

angular.module 'blog', ['ngRoute', 'ngResource']

require './router.coffee'

require './filters/markdown.coffee'

require './services/posts.coffee'

require './controllers/postsIndex.coffee'
require './controllers/postsNew.coffee'
require './controllers/postsShow.coffee'
require './controllers/postsEdit.coffee'
