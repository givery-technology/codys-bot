# Description:
#   Convenient utilities.
#
# Commands:
#   placehold <width> <height> - Link to placehold.it
#   <width>x<height>
#

placeholdit = (width, height) ->
  return "https://placehold.it/#{width}x#{height}"

module.exports = (robot) ->

  robot.respond /placehold (\d{1,}) (\d{1,})/i, (msg) ->
    width = msg.match[1]
    height = msg.match[2]
    msg.send placeholdit(width, height)

# Might be removed if it conflicts with other command
  robot.respond /(\d{1,})x(\d{1,})/i, (msg) ->
    width = msg.match[1]
    height = msg.match[2]
    msg.send placeholdit(width, height)
