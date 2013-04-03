wats = [
  "http://emotibot.net/pix/3867.jpg"
]

module.exports = (robot) ->
  robot.hear /wat/i, (msg) ->
    msg.send msg.random wats
