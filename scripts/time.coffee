# Description:
#   Get time
#
# Commands:
#   hubot time - Tell us the time
#

moment = require 'moment-timezone'
timezones = {
  'Albania': 'Europe/Tirane'
  'Netherlands': 'Europe/Amsterdam'
  'America': 'America/Kentucky/Monticello'
  'Canada(Tronto)': 'America/Tronto'
  'India': 'Asia/Colombo'
  'Tokyo': 'Asia/Tokyo'
}

module.exports = (robot) ->
  robot.respond /time/, (msg) ->
    now = new Date().getTime()
    times = ((place + ": " + moment(now).tz(tz).format('YYYY-MM-DD HH:mm ZZ')) for place, tz of timezones)
    msg.send times.join("\n")
