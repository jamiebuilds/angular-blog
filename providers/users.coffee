mongoose     = require 'mongoose'
mongooseAuth = require 'mongoose-auth'
RSVP         = require 'rsvp'

UserSchema = new mongoose.Schema
  created_at : type: Date
  updated_at : type: Date
  first_name : String
  last_name  : String

UserSchema.pre 'save', (next) ->
  @updated_at  = new Date
  @created_at ?= new Date
  next()

UserSchema.plugin mongooseAuth,
  everymodule: everyauth: User: -> User
  password:
    loginWith: 'email'
    everyauth:
      getLoginPath: '/login'
      postLoginPath: '/login'
      loginView: 'index.jade'
      getRegisterPath: '/register'
