landing = require './routes/landing'

module.exports.initialize = (server) ->
  server.get '/', landing.index
