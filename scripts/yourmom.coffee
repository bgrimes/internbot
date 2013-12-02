yourmoms = [
  "https://dl.dropboxusercontent.com/u/45215568/internbot/yourmom1.jpeg"
  "https://dl.dropboxusercontent.com/u/45215568/internbot/yourmom2.jpeg"
  "https://dl.dropboxusercontent.com/u/45215568/internbot/yourmom3.jpeg"
  "http://dl.dropboxusercontent.com/u/45215568/internbot/yourmom4.jpeg"
]

module.exports = (robot) ->
  robot.hear /your mom/i, (msg) ->
    msg.send msg.random yourmoms
