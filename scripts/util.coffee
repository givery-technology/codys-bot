# Description:
#   Convenient utilities.
#
# Commands:
#   hubot placehold <width> <height> - Link to placehold.it
#   hubot <width>x<height>
#

placeholdit = (width, height) ->
  return "https://placehold.it/#{width}x#{height}"

module.exports = (robot) ->

  robot.respond /(placehold|ph) (\d{1,})[x ](\d{1,})/i, (msg) ->
    width = msg.match[1]
    height = msg.match[2]
    msg.send placeholdit(width, height)

# Might be removed if it conflicts with other command
  robot.respond /(\d{1,})x(\d{1,})/i, (msg) ->
    width = msg.match[1]
    height = msg.match[2]
    msg.send placeholdit(width, height)
