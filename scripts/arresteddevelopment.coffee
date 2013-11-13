_ = require 'underscore'
Scraper = require 'scraper'

quotes = []

options =
  'uri': 'http://en.wikiquote.org/wiki/Arrested_Development'
  'headers':
    'User-Agent': 'User-Agent: Archerbot for Hubot (+https://github.com/github/hubot-scripts)'

## This could be improved, the whole jsdom stuff seems to cause hubot to hang for a while.
Scraper options, (err, $) ->
  allQuotes = _($('dl').toArray()).map (dl) ->
    $(dl).text().trim()

  _(allQuotes).each (text) ->
    quotes.push(text)

  console.log "quotes ready, #{allQuotes.length} quotes found"

module.exports = (robot) ->
  robot.hear /!ad$/, (msg) ->
    msg.send msg.random quotes
  robot.hear /!ad (.*)$/, (msg) ->
    match = new RegExp msg.match[1], 'i'
    filteredQuotes = _(quotes).filter (quote) -> match.test quote
    msg.send msg.random filteredQuotes
