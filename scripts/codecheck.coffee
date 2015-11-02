# Description:
#   Dummy testing commands
#
module.exports = (robot) ->
  robot.respond /deploy ping/, (msg) ->
    msg.send "PONG"
  robot.respond /deploy codecheck/, (msg) ->
    msg.send "run ansible"
