_ = require 'underscore'
Request  =  require  'request'
Cheerio  =  require  'cheerio'
Scraper = require 'scraper'

Request = Request.defaults {headers: {'User-Agent: internbot (https://github.com/anthonymarion/internbot)'}}

quotes = []

options =
  'uri': 'http://en.wikiquote.org/wiki/Futurama'
  'headers':
    'User-Agent': 'User-Agent: Archerbot for Hubot (+https://github.com/github/hubot-scripts)'

## This could be improved, the whole jsdom stuff seems to cause hubot to hang for a while.
Scraper options, (err, $) ->
  allQuotes = _($('dl').toArray()).map (dl) ->
    $(dl).text().trim()
  allQuotes = _(allQuotes).filter (text) ->
    /zoidberg/i.test text
  allQuotes.forEach (quote) -> quotes.push quote
  console.log "zoidberg ready, #{quotes.length} quotes found"

module.exports = (robot) ->
  robot.hear /!zoidberg/, (msg) ->
    console.log 'got zoidberg request'
    message = msg.random quotes
    msg.send message
