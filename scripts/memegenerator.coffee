Request = require 'request'

username = process.env.MEMEGENERATOR_USERNAME
password = process.env.MEMEGENERATOR_PASSWORD

module.exports = (robot) ->
  robot.hear /prepare yourself, (.+)/i, (msg) ->
    params = {
      method: 'GET',
      url: 'http://version1.api.memegenerator.net/Instance_Create'
      qs: {
        username: username
        password: password
        languageCode: 'en'
        generatorID: 414926
        imageID: 2295701
        text0: "Prepare Yourself"
        text1: msg.match[1]
      }
    }
    Request.get params, (err, res, body) ->
      console.log("err", err) if err
      body = JSON.parse body
      console.log(body) if not body.result

      image = "http://cdn.memegenerator.net/instances/400x/#{body.result.instanceID}.jpg"
      msg.send image

# Meme: generatorID, imageID
# Courage wolf: 303
# Prepare-Yourself: 414926, 2295701
