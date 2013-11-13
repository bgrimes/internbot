Request = require 'request'
_ = require 'underscore'

username = process.env.MEMEGENERATOR_USERNAME
password = process.env.MEMEGENERATOR_PASSWORD

## Getting these ids are kind of a pain. The best way I've found to do it is by using
## http://version1.api.memegenerator.net/Instances_Select_ByNew?languageCode=en&pageIndex=0&pageSize=12&urlName=Huge-Mistake
## substituing "Huge-Mistake" for the url-name of the meme you want to use. Getting the url-name
## is pretty easy, just search memegenerator.net and look at the address bar.
memes = [
  {
    trigger: /prepare yourself,? (.+)/i
    generatorID: 414926
    imageID: 2295701
    text0: "PREPARE YOURSELF"
    text1: (match) -> match[1]
  }
  {
    trigger: /(.+) huge mistake/i
    generatorID: 1823497
    imageID: 7547342
    text0: (match) -> match[1]
    text1: "HUGE MISTAKE"
  }
  {
    trigger: /not sure if (.+) or (.+)/i
    generatorID: 305
    imageID: 84688
    text0: (match) -> "NOT SURE IF #{match[1]}"
    text1: (match) -> "OR #{match[2]}"
  }
]

# Courage wolf: 303

module.exports = (robot) ->
  robot.hear /!meme (.*)/, (msg) ->
    text = msg.match[1]
    _(memes).select (meme) -> # select stops execution after we find the first true return
      return if msg.message.user.name.match /parbot/i

      match = meme.trigger.exec text
      return false if not match

      params = {
        method: 'GET'
        url: 'http://version1.api.memegenerator.net/Instance_Create'
        qs: {
          username: username
          password: password
          languageCode: 'en'
          generatorID: meme.generatorID
          imageID: meme.imageID
          text0: if _.isFunction(meme.text0) then meme.text0(match) else meme.text0
          text1: if _.isFunction(meme.text1) then meme.text1(match) else meme.text1
        }
      }

      Request.get params, (err, res, body) ->
        return console.log('err', err) if err
        body = JSON.parse body
        return console.log(body) if not body.result
        image = "http://cdn.memegenerator.net/instances/400x/#{body.result.instanceID}.jpg"
        msg.send image
      
      return true
