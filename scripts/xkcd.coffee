Request = require 'request'
Cheerio = require 'cheerio'

url = 'http://dynamic.xkcd.com/random/comic/'

module.exports = (robot) ->
  robot.hear /xkcd/i, (msg) ->
    Request.get url, (err, res, body) ->
      Request.get res.request.href, (err, res, body) ->
        $ = Cheerio.load body
        msg.send $('div#comic img').attr('src')
