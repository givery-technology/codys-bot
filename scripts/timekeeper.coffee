# Description:
#   Cron script for time keeping
#
# Commands:
#   No commands
#
cron = require('cron').CronJob

module.exports = (robot) ->
  new cron('0 0 11 * * 1-5', () ->
    robot.messageRoom "#general", "Guys, let's scrum.\nIt's 11:00 JST"
  , null, true, 'Asia/Tokyo').start()
  new cron('0 0 12 * * 1-5', () ->
    robot.messageRoom "#general", "Now 12:00 JST"
  , null, true, 'Asia/Tokyo').start()
  new cron('0 0 18 * * 1-5', () ->
    robot.messageRoom "#general", "The time is now 18:00 JST"
  , null, true, 'Asia/Tokyo').start()
  new cron('0 30 18 * * 1-5', () ->
    robot.messageRoom "#general", "Time for Garbage Collection!! 18:30 JST\n* collect garbage from all dust box\n* check wastepaper in shredders\n* DO NOT forget to check garbage in the kitchen"
  , null, true, 'Asia/Tokyo').start()
  new cron('0 0 11 28 * *', () ->
    robot.messageRoom "#general", "@everyone Transportation feeeeeee!!!! https://www.cloud-timecard.jp/web/XjJ465E3/login"
  , null, true, 'Asia/Tokyo').start()
