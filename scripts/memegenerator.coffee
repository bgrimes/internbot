Request = require 'request'
_ = require 'underscore'

username = process.env.MEMEGENERATOR_USERNAME
password = process.env.MEMEGENERATOR_PASSWORD

memes = [
  {
    trigger: /prepare yourself,? (.+)/i
    generatorID: 414926
    imageID: 2295701
    text0: "PREPARE YOURSELF"
    text1: (match) -> match[1]
  }
  {
    trigger: /(.+) all the (.+)/i
    generatorID: 318065
    imageID: 1985197
    text0: (match) -> match[1]
    text1: (match) -> "ALL THE " + match[2]
  }
  {
    trigger: /(.+) huge mistake/i
    generatorID: 1823497
    imageID: 7547342
    text0: (match) -> match[1]
    text1: "HUGE MISTAKE"
  }
]

# Courage wolf: 303

module.exports = (robot) ->
  _(memes).each (data) ->
    robot.hear data.trigger, (msg) ->
      return if msg.message.user.name.match /parbot/i
      params = {
        method: 'GET'
        url: 'http://version1.api.memegenerator.net/Instance_Create'
        qs: {
          username: username
          password: password
          languageCode: 'en'
          generatorID: data.generatorID
          imageID: data.imageID
          text0: if _.isFunction(data.text0) then data.text0(msg.match) else data.text0
          text1: if _.isFunction(data.text1) then data.text1(msg.match) else data.text1
        }
      }

      Request.get params, (err, res, body) ->
        return console.log('err', err) if err
        body = JSON.parse body
        return console.log(body) if not body.result
        image = "http://cdn.memegenerator.net/instances/400x/#{body.result.instanceID}.jpg"
        msg.send image

