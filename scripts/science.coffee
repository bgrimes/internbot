Request = require 'request'

module.exports = (robot) ->
  robot.hear /science/i, (msg) ->
    Request.get 'http://www.reddit.com/r/science.json', (err, res, body) ->
      result = JSON.parse(body) if typeof body is 'string'

      if result.data.children.count <= 0
        return
      
      urls = [ ]
      for child in result.data.children
        urls.push(child.data.url)
        
      rnd = Math.floor(Math.random()*urls.length)
      msg.send urls[rnd]
