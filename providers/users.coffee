mongoose      = require 'mongoose'
bcrypt        = require 'bcrypt'
RSVP          = require 'rsvp'

UserSchema = new mongoose.Schema
  created_at : type: Date
  updated_at : type: Date
  first_name : type: String, required: true
  last_name  : type: String, required: true
  email      : type: String, required: true, unique: true
  password   : type: String

UserSchema.pre 'save', (next) ->
  @updated_at  = new Date
  @created_at ?= new Date

  unless @isModified 'password' then return next()

  bcrypt.genSalt 10, (err, salt) =>
    if err then return next err

    bcrypt.hash @password, salt, (err, hash) =>
      if err then return next err
      @password = hash
      next()

UserSchema.methods.comparePassword = (password, callback) ->
  bcrypt.compare password, @password, callback

User = mongoose.model 'User', UserSchema

module.exports =
  model: User

  authenticate: (email, password, callback) ->
    User.findOne email: email, (err, user) ->
      if err      then return callback err
      unless user then return callback null, false, message: 'Unknown User'

      user.comparePassword password, (err, isMatch) ->
        if err
          callback err
        else if isMatch
          callback null, user
        else
          callback null, false, message: 'Invalid Password'

  findAll: -> new RSVP.Promise (resolve, reject) =>
    User.find (err, users) ->
      if err then reject err else resolve users

  findById: (id) -> new RSVP.Promise (resolve, reject) =>
    User.findById id, 'first_name last_name email', (err, user) ->
      if err then reject err else resolve user

  create: (data) -> new RSVP.Promise (resolve, reject) =>
    user = new User data

    user.save (err) ->
      if err then reject err else resolve user

  update: (id, data) -> new RSVP.Promise (resolve, reject) =>
    User.findByIdAndUpdate id,
      first_name : data.first_name
      last_name  : data.last_name
      email      : data.email
    , (err, user) ->
      if err then reject err else resolve user

  updatePassword: (id, password) -> new RSVP.Promise (resolve, reject) =>
    User.findByIdAndUpdate id,
      password : password
    , (err, user) ->
      if err then reject err else resolve user

  destroy: (id) -> new RSVP.Promise (resolve, reject) =>
    Post.findByIdAndRemove id, (err, user) ->
      if err then reject err else resolve()
