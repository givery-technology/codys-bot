# Description:
#   Get time
#
# Commands:
#   hubot time - Tell us the time
#

moment = require 'moment-timezone'
timezones = {
  'America' : 'America/Phoenix'
#  'America': 'America/Kentucky/Monticello'
#  'Canada(Toronto)': 'America/Toronto'
#  'Albania': 'Europe/Tirane'
  'Netherland': 'Europe/Amsterdam'
  'Taipei': 'Asia/Taipei'
#  'India': 'Asia/Colombo'
#  'Philippines': 'Asia/Manila'
  'Tokyo': 'Asia/Tokyo'
  'Vietnam': 'Asia/Ho_Chi_Minh'
}

module.exports = (robot) ->
  robot.respond /time/, (msg) ->
    now = new Date().getTime()
    times = ((place + ": " + moment(now).tz(tz).format('YYYY-MM-DD HH:mm ZZ')) for place, tz of timezones)
    msg.send times.join("\n")
