mongoose = require 'mongoose'
RSVP     = require 'rsvp'

postSchema = new mongoose.Schema
  date    : type: Date, default: Date.now
  title   : String
  author  : String
  content : String

postSchema.index date: -1

Post = mongoose.model 'Post', postSchema

module.exports =
  findAll: -> new RSVP.Promise (resolve, reject) =>
    Post.find (err, results) ->
      if err then reject err else resolve results

  findById: (id) -> new RSVP.Promise (resolve, reject) =>
    Post.findById id, (err, result) ->
      if err then reject err else resolve result

  create: (data) -> new RSVP.Promise (resolve, reject) =>
    post = new Post data

    post.save (err) ->
      if err then reject err else resolve post

  update: (id, data) -> new RSVP.Promise (resolve, reject) =>
    Post.findById id, (err, result) ->
      result.title   = data.title
      result.author  = data.author
      result.content = data.content

      result.save (err) ->
        if err then reject err else resolve result

  destroy: (id) -> new RSVP.Promise (resolve, reject) =>
    Post.findById id, (err, result) ->
      result.remove (err) ->
        if err then reject err else resolve()
