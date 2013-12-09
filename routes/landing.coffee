module.exports =
  index: (req, res) ->
    res.render 'landing/index.jade', title: 'Home'
