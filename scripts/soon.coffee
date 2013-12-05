soons = [
  "http://i2.kym-cdn.com/photos/images/newsfeed/000/117/008/soon_honey_beer_bottle.jpg"
  "http://i2.kym-cdn.com/photos/images/newsfeed/000/117/009/soon.jpg"
  "http://i3.kym-cdn.com/photos/images/newsfeed/000/117/013/cjZXR.jpg"
  "http://i3.kym-cdn.com/photos/images/newsfeed/000/117/021/enhanced-buzz-28895-1301694293-0.jpg"
  "http://i3.kym-cdn.com/photos/images/newsfeed/000/117/022/enhanced-buzz-28904-1301694302-1.jpg"
]

shoons = [
  "http://static.fjcdn.com/pictures/Shoon_9958ef_3492839.jpg"
]

module.exports = (robot) ->
  robot.hear /SOON/, (msg) ->
    msg.send msg.random soons
  robot.hear /shoon/i, (msg) ->
    msg.send msg.random shoons
