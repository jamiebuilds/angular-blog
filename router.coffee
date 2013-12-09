postsProvider = require './providers/posts'

module.exports.initialize = (server) ->
  server.get '/api/posts', (req, res) ->
    postsProvider.findAll().then (posts) ->
      res.send posts
    , (err) ->
      res.send 500

  server.post '/api/posts', (req, res) ->
    postsProvider.create( req.body ).then (post) ->
      res.send post
    , (err) ->
      res.send 500

  server.get '/api/posts/:id', (req, res) ->
    postsProvider.findById( req.params.id ).then (post) ->
      res.send post
    , (err) ->
      res.send 500

  server.post '/api/posts/:id', (req, res) ->
    postsProvider.update( req.params.id, req.body ).then (post) ->
      res.send post
    , (err) ->
      res.send 500

  server.delete '/api/posts/:id', (req, res) ->
    postsProvider.destroy( req.params.id ).then ->
      res.send 200
    , (err) ->
      res.send 500

  server.get '/*', (req, res) ->
    res.render 'index.jade', title: 'Home'
