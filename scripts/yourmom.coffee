yourmoms = [
  "https://dl.dropboxusercontent.com/u/45215568/internbot/yourmom1.jpeg"
  "https://dl.dropboxusercontent.com/u/45215568/internbot/yourmom2.jpeg"
  "https://dl.dropboxusercontent.com/u/45215568/internbot/yourmom3.jpeg"
  "http://dl.dropboxusercontent.com/u/45215568/internbot/yourmom4.jpeg"
]

module.exports = (robot) ->
  robot.hear /your mom/i, (msg) ->
    msg.send msg.random yourmoms

  robot.hear /dana'?s mom/i, (msg) ->
    msg.send "http://content.screencast.com/users/DanaBourkeSFDC/folders/Jing/media/a922e992-e7c1-457c-b7fb-514bc7131077/00000129.png"
