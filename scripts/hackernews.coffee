# Description:
#   Hacker News
#
# Dependencies:
#   "nodepie": "0.5.0"
#
# Configuration:
#   None
#
# Commands:
#   hubot hn top <N> - get the top N items on hacker news (or your favorite RSS feed)
#   hn.top - refer to the top item on hn
#   hn[i] - refer to the ith item on hn
#
# Author:
#   skimbrel

NodePie = require("nodepie")

hnFeedUrl = "https://news.ycombinator.com/rss"

module.exports = (robot) ->
  robot.respond /!(hn|hackernews)/i, (msg) ->
    msg.http(hnFeedUrl).get() (err, res, body) ->
      if res.statusCode is not 200
        console.log "Something's gone awry"
      else
        feed = new NodePie(body)
        try
          feed.init()
          count = feed.getItemQuantity()
          rnd = Math.floor(Math.random() * count)
          item = feed.getItem(rnd)
          msg.send item.getTitle() + ": " + item.getPermalink() + " (" + item.getComments()?.html + ")"
        catch e
          console.log(e)
          msg.send "Something's gone awry"
