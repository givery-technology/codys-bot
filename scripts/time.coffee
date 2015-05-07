# Description:
#   Get time
#
# Commands:
#   hubot time - Tell us the time
#

moment = require 'moment-timezone'
timezones = {
  'Tokyo': 'Asia/Tokyo'
  'India': 'Asia/Colombo'
  'America': 'America/Kentucky/Monticello'
}

module.exports = (robot) ->
  robot.respond /time/, (msg) ->
    now = new Date().getTime()
    times = ((place + ": " + moment(now).tz(tz).format('YYYY-MM-DD HH:mm ZZ')) for place, tz of timezones)
    msg.send times.join("\n")
