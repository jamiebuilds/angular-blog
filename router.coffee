passport         = require 'passport'
passportLocal    = require 'passport-local'
UsersProvider    = require './providers/users'
PostsProvider    = require './providers/posts'

passport.use new passportLocal.Strategy usernameField: 'email', UsersProvider.authenticate

passport.serializeUser (user, callback) ->
  callback null, user.get '_id'

passport.deserializeUser (id, callback) ->
  UsersProvider.findById(id).then (user) ->
    callback null, user
  , (err) ->
    callback err

ensureAuthenticated = (req, res, next) ->
  if req.isAuthenticated() then next() else res.send 403

module.exports.initialize = (server) ->

  # posts#index
  server.get '/api/posts', (req, res) ->
    PostsProvider.findAll().then (posts) ->
      res.send posts
    , (err) ->
      res.send 500

  # posts#create
  server.post '/api/posts', ensureAuthenticated, (req, res) ->
    PostsProvider.create( req.user, req.body ).then (post) ->
      res.send post
    , (err) ->
      res.send 500

  # posts#show
  server.get '/api/posts/:id', (req, res) ->
    PostsProvider.findById( req.params.id ).then (post) ->
      res.send post
    , (err) ->
      res.send 500

  # posts#update
  server.post '/api/posts/:id', ensureAuthenticated, (req, res) ->
    PostsProvider.update( req.user, req.params.id, req.body ).then (post) ->
      res.send post
    , (err) ->
      res.send 500

  # posts#destroy
  server.delete '/api/posts/:id', ensureAuthenticated, (req, res) ->
    PostsProvider.destroy( req.user, req.params.id ).then ->
      res.send 200
    , (err) ->
      res.send 500

  # users#new
  server.post '/api/users', (req, res) ->
    UsersProvider.create( req.body ).then (user) ->
      res.send user
    , (err) ->
      res.send 500

  # users#show
  server.get '/api/users/me', ensureAuthenticated, (req, res) ->
    UsersProvider.findById( req.user ).then (user) ->
      res.send user
    , (err) ->
      res.send 500

  # users#update
  server.post '/api/users/me', ensureAuthenticated, (req, res) ->
    UsersProvider.update( req.user, req.body ).then (user) ->
      res.send user
    , (err) ->
      res.send 500

  # session#create
  server.post '/api/login', passport.authenticate('local'), (req, res) ->
    res.send req.user

  # session#destroy
  server.get '/api/logout', (req, res) ->
    req.logout()
    res.send 200

  # application
  server.get '/*', (req, res) ->
    res.render 'index.jade', title: 'Home'
