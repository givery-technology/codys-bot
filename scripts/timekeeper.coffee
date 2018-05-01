# Description:
#   Cron script for time keeping
#
# Commands:
#   No commands
#
cron = require("cron").CronJob

module.exports = (robot) ->
  new cron("0 0 10 * * 1-5", () ->
    robot.messageRoom "#givery-technology", "Guys, let's scrum.\nIt's 10:00 JST"
  , null, true, "Asia/Tokyo").start()
  new cron("0 0 12 * * 1-5", () ->
    robot.messageRoom "#givery-technology", "12:00 JST! It's time to think about today's lunch menu~ :hamburger: :ramen: :taco: :sushi: :pizza: :curry: #yurubo-lunch"
  , null, true, "Asia/Tokyo").start()
  new cron("0 0 18 * * 1-5", () ->
    robot.messageRoom "#givery-technology", "The time is now 18:00 JST"
  , null, true, "Asia/Tokyo").start()
  new cron("0 30 18 * * 1-5", () ->
    robot.messageRoom "#givery-technology", "@channel Time for Garbage Collection!! 18:30 JST\n* collect garbage from all dust box\n* check wastepaper in shredders\n* DO NOT forget to check garbage in the kitchen"
  , null, true, "Asia/Tokyo").start()
  new cron("0 10 11 1 * *", () ->
    robot.messageRoom "#givery-technology", "@channel Please apply your transportation feeeeeeeee!!\nfrom  https://ic.next-cloud.jp/web/XjJ465E3/login"
  , null, true, "Asia/Tokyo").start()
