{exec}   =  require  'child_process'
_ = require 'underscore'

last_said = new Array()
last_twenty = []
sed_regexp = new RegExp "^s/(([^/]|(\\\\/))*)/(([^/]|(\\\\/))*)(/([gi]*))?$"

pushMessage = (username, message) ->
  if not last_twenty[username]
    last_twenty[username] = [message]
  else
    last_twenty[username].unshift message
    if last_twenty[username].length >= 20
      last_twenty[username].pop()

  pushMessage("*", message) if username isnt "*" # special all case

module.exports = (robot) ->
  robot.hear /^(([a-zA-Z_0-9]+):)?\s*(.+)$/, (request) ->
    {robot, message, match} = request
    origUser = message.user.name.toLowerCase()
    targetUser = match[2]?.toLowerCase() || origUser

    result = sed_regexp.exec match[3]
    return pushMessage(origUser, match[3]) if not result

    search = new RegExp result[1], result[8]
    replace = result[4]

    messageMatchSearch = (recordedMessage) ->
      if recordedMessage.match search
        request.send recordedMessage.replace search, replace
        return true
      else
        return false

    return if _(last_twenty[targetUser]).any messageMatchSearch
    return if _(last_twenty["*"]).any messageMatchSearch
    pushMessage origUser, message
