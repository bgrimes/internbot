#!/bin/bash

heroku config:add HUBOT_HIPCHAT_JID="hipchat jabber id"
heroku config:add HUBOT_HIPCHAT_PASSWORD="password"
heroku config:add HUBOT_HIPCHAT_JOIN_ROOMS_ON_INVITE="chatroom"
heroku config:add HUBOT_LOG_LEVEL="info"
