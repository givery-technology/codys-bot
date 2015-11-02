# Description:
#   LGTM :troll:
#
# Commands:
#   cody lgtm

request = require 'request'

TAK = 'Looks Tak To Me :troll:\nhttp://i.imgur.com/8OZoJIx.gif'
options =
  url: 'http://www.lgtm.in/g'
  method: 'GET'
  json: true

module.exports = (robot) ->
  robot.respond /lgtm *(tak)?$/i, (msg) ->
    request options, (error, response, json) ->
      if msg.match[1]
        lgtm = TAK
      else if error
        lgtm = "Sorry, something wrong happend :troll:"
      else
        lgtm = "LGTM!!\n#{json.imageUrl}"
      msg.send lgtm

