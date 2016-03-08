# Description:
#   Convenient utilities.
#
# Commands:
#   placehold 
#

module.exports = (robot) ->

  robot.respond /placehold (\d{1,})x(\d{1,})/i, (msg) ->
    width = msg.match[1]
    height = msg.match[2]
    msg.send 'https://placehold.it/'+width+'x'+height