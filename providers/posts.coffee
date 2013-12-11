mongoose = require 'mongoose'
RSVP     = require 'rsvp'

PostSchema = new mongoose.Schema
  created_at : type: Date
  updated_at : type: Date
  _user      : type: mongoose.Schema.ObjectId, ref: 'User'
  title      : type: String, required: true
  content    : type: String, required: true
  _comments  : [ type: mongoose.Schema.ObjectId, ref: 'Comment' ]

PostSchema.pre 'save', (next) ->
  @updated_at  = new Date
  @created_at ?= new Date
  next()

Post = mongoose.model 'Post', PostSchema

module.exports =
  model: Post

  findAll: -> new RSVP.Promise (resolve, reject) =>
    Post.find (err, posts) ->
      if err then reject err else resolve posts

  findById: (id) -> new RSVP.Promise (resolve, reject) =>
    Post.findById id, (err, post) ->
      if err then reject err else resolve post

  create: (user, data) -> new RSVP.Promise (resolve, reject) =>
    post = new Post
      title   : data.title
      content : data.content
      _user   : user._id

    post.save (err) ->
      if err then reject err else resolve post

  update: (user, id, data) -> new RSVP.Promise (resolve, reject) =>
    Post.findById id, (err, post) ->
      post.title   = data.title
      post.content = data.content
      post._user   = user._id

      post.save (err) ->
        if err then reject err else resolve post

  destroy: (user, id) -> new RSVP.Promise (resolve, reject) =>
    Post.findById id, (err, post) ->
      post.remove (err) ->
        if err then reject err else resolve()
