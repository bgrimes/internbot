Request = require 'request'
Cheerio = require 'cheerio'
qs = require 'querystring'

url = 'http://dynamic.xkcd.com/random/comic/'

module.exports = (robot) ->
  robot.hear /!xkcd$/i, (msg) ->
    Request.get url, (err, res, body) ->
      Request.get res.request.href, (err, res, body) ->
        $ = Cheerio.load body
        msg.send $('div#comic img').attr('src')
        msg.send "Alt text: " + $('div#comic img').attr('title')
  robot.hear /!xkcd (.*)$/, (msg) ->
    query =
      v: '1.0'
      q: "site:xkcd.com " + msg.match[1]
    Request.get "http://ajax.googleapis.com/ajax/services/search/web?#{qs.stringify query}", (err, res, body) ->
      body = JSON.parse body
      return if not body.responseData or not body.responseData.results or body.responseData.results.length is 0
      results = body.responseData.results
      Request.get results[0].url, (err, res, body) ->
        $ = Cheerio.load body
        msg.send $('div#comic img').attr('src')
        msg.send "Alt text: " + $('div#comic img').attr('title')
