# Description:
#   Convenient utilities.
#
# Commands:
#   placehold <width> <height> - Link to placehold.it
#

module.exports = (robot) ->

  robot.respond /placehold (\d{1,}) (\d{1,})/i, (msg) ->
    width = msg.match[1]
    height = msg.match[2]
    msg.send 'https://placehold.it/'+width+'x'+height
