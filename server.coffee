express  = require 'express'
mongoose = require 'mongoose'
config   = require './config'

server = express()

server.configure ->
  server.set 'views', "#{__dirname}/views"
  server.set 'view engine', 'jade'
  server.use express.favicon()
  server.use express.logger 'dev'
  server.use express.bodyParser()
  server.use express.methodOverride()
  server.use server.router
  server.use express.static "#{__dirname}/public"

server.configure 'development', ->
  server.use express.errorHandler()

server.get '/', (req, res) ->
  res.render 'index.jade', title: 'Home'

mongoose.connect config.db.host, config.db.name, config.db.port, (err) ->
  if err
    console.log "Could not connect to Mongo: #{err}"
    process.exit 1

  server.listen config.server.port, ->
    console.log "Server started on port #{config.server.port}"
