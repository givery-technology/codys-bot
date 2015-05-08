# Description:
#   Cron script for time keeping
#
# Commands:
#   No commands
#
cron = require('cron').CronJob

module.exports = (robot) ->
  new cron('0 0 11 * * 1-5', () ->
    robot.messageRoom "#general", "Guys, let's scrum.\nIt's 11:00 UTC+0900"
  , null, true, 'Asia/Tokyo').start()
  new cron('0 0 12 * * 1-5', () ->
    robot.messageRoom "#general", "Now 12:00 UTC+0900"
  , null, true, 'Asia/Tokyo').start()
  new cron('0 0 18 * * 1-5', () ->
    robot.messageRoom "#general", "The time is now 18:00 UTC+0900"
  , null, true, 'Asia/Tokyo').start()
  new cron('0 0 11 28 * *'), () ->
    robot.messageRoom "#general", "@everyone Transportation feeeeeee!!!! https://www.cloud-t
  , null, true, 'Asia/Tokyo').start()
