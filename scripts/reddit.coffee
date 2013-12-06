Request = require 'request'
_ = require 'underscore'

subs = [
  #{
    #trigger: /!science/i
    #subreddit: 'science'
  #}
  {
    trigger: /'merica/i
    subreddit: 'merica'
  }
  {
    trigger: /!beer/i
    subreddit: 'beerporn'
  }
  {
    trigger: /!food/i
    subreddit: 'foodporn'
  }
  {
    trigger: /what could(.*)go wrong/
    subreddit: 'whatcouldgowrong'
  }
  #{
    #trigger: /aww/i
    #subreddit: 'aww'
  #}
]

module.exports = (robot) ->
  _(subs).each (sub) ->
    { trigger, subreddit } = sub

    robot.hear trigger, (msg) ->
      Request.get "http://www.reddit.com/r/#{subreddit}.json", (err, res, body) ->
        result = JSON.parse(body) if typeof body is 'string'

        if result.data.children.count <= 0
          return
        
        urls = [ ]
        for child in result.data.children
          urls.push(child.data.url) if child.data.thumbnail isnt 'self'
          
        rnd = Math.floor(Math.random()*urls.length)
        msg.send urls[rnd]
