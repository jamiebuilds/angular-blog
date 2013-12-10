require 'angular'
require 'angular-route'
require 'angular-resource'

angular.module 'blog', ['ngRoute', 'ngResource']

require './router.coffee'

require './services/posts.coffee'

require './controllers/postsIndex.coffee'
require './controllers/postsNew.coffee'
require './controllers/postsShow.coffee'
require './controllers/postsEdit.coffee'
