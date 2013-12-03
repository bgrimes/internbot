yourmoms = [
  "https://dl.dropboxusercontent.com/u/45215568/internbot/yourmom1.jpeg"
  "https://dl.dropboxusercontent.com/u/45215568/internbot/yourmom2.jpeg"
  "https://dl.dropboxusercontent.com/u/45215568/internbot/yourmom3.jpeg"
  "http://dl.dropboxusercontent.com/u/45215568/internbot/yourmom4.jpeg"
]

danasmoms = [
  "http://content.screencast.com/users/DanaBourkeSFDC/folders/Jing/media/f1d4968f-1945-4ff5-9782-5bb18aeb6518/00000130.png"
  "http://content.screencast.com/users/DanaBourkeSFDC/folders/Jing/media/a922e992-e7c1-457c-b7fb-514bc7131077/00000129.png"
  "http://content.screencast.com/users/DanaBourkeSFDC/folders/Jing/media/8e1b1625-b5ba-440d-9879-37c2d5f319b0/00000131.png"
  "http://content.screencast.com/users/DanaBourkeSFDC/folders/Jing/media/066bb262-2c33-4415-a0ac-9c4ec0b6d3ba/00000132.png"
  "http://content.screencast.com/users/DanaBourkeSFDC/folders/Jing/media/db23ef53-7157-4742-8d83-757161251cd3/00000133.png"
]

module.exports = (robot) ->
  robot.hear /your mom/i, (msg) ->
    msg.send msg.random yourmoms

  robot.hear /dana'?s mom/i, (msg) ->
    msg.send msg.random danasmoms
