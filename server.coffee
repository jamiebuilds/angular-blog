express    = require 'express'
mongoose   = require 'mongoose'
passport   = require 'passport'
stylus     = require 'stylus'
browserify = require 'browserify-middleware'
config     = require './config'
router     = require './router'

server = express()

server.configure ->
  # Misc Middleware
  server.use express.logger 'dev'
  server.use express.compress()
  server.use express.methodOverride()
  server.use express.bodyParser()
  server.use express.cookieParser()

  # Views
  server.set 'views', "#{__dirname}/views"
  server.set 'view engine', 'jade'

  # Styles
  server.use stylus.middleware src: "#{__dirname}/public"

  # Scripts
  server.use "/scripts/app.js", browserify './public/scripts/app.coffee',
    transform: ['coffeeify', 'debowerify']

  # Static
  server.use express.static "#{__dirname}/public"
  server.use express.favicon()

  # Authentication
  server.use express.session secret: config.server.secret
  server.use passport.initialize()
  server.use passport.session()

  # Router
  server.use server.router

server.configure 'development', ->
  server.use express.errorHandler()

router.initialize server

mongoose.connect config.db.host, config.db.name, config.db.port, (err) ->
  if err
    console.log "Could not connect to Mongo: #{err}"
    process.exit 1

  server.listen config.server.port, ->
    console.log "Server started on port #{config.server.port}"
