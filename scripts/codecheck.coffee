module.exports = (robot) ->
  robot.respond /deploy ping/, (msg) ->
    msg.send "PONG"
  robot.respond /deploy test/, (msg) ->
    msg.send "run ansible"
