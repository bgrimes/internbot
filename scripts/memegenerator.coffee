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
    text1: null
  }
  {
    trigger: /(.+) all the things/i
    generatorID: 318065
    imageID: 1985197
    text0: null
    text1: "ALL THE THINGS"
  }
]

# Courage wolf: 303

module.exports = (robot) ->
  _(memes).each (data) ->
    robot.hear data.trigger, (msg) ->
      params = {
        method: 'GET'
        url: 'http://version1.api.memegenerator.net/Instance_Create'
        qs: {
          username: username
          password: password
          languageCode: 'en'
          generatorID: data.generatorID
          imageID: data.imageID
          text0: if data.text0 isnt null then data.text0 else msg.match[1]
          text1: if data.text1 isnt null then data.text1 else msg.match[1] # TODO: shift a match off of msg.match
        }
      }
      Request.get params, (err, res, body) ->
        return console.log('err', err) if err
        body = JSON.parse body
        return console.log(body) if not body.result
        image = "http://cdn.memegenerator.net/instances/400x/#{body.result.instanceID}.jpg"
        msg.send image

