#!/bin/bash

export HUBOT_HIPCHAT_JID=""
export HUBOT_HIPCHAT_PASSWORD=""
export HUBOT_HIPCHAT_JOIN_ROOMS_ON_INVITE=""
export HUBOT_LOG_LEVEL=""

./node_modules/hubot/bin/hubot -a hipchat &
