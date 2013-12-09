_ = require 'underscore'

module.exports = (robot) ->
  robot.hear /!nyancat/, (msg) ->
    nyancat = ''
    nyans = _.random(5, 20)
    _(nyans).times ->
      nyancat += '(nyan)'
    nyancat += '(cat)'
    msg.send nyancat

  robot.hear /!nyanian/, (msg) ->
    nyancat = ''
    nyans = _.random(5, 20)
    _(nyans).times ->
      nyancat += '(nyan)'
    nyancat += '(ian)'
    msg.send nyancat
