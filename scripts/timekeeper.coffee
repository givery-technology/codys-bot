# Description:
#   Cron script for time keeping
#
# Commands:
#   No commands
#
cron = require("cron").CronJob

channel = "#givery-technology"
timezone = "Asia/Tokyo"

module.exports = (robot) ->
  new cron("0 0 10 * * 1-5", () ->
    robot.messageRoom channel, "Guys, let's scrum.\nIt's 10:00 JST"
  , null, true, timezone).start()
  new cron("0 0 12 * * 1-5", () ->
    robot.messageRoom channel, "12:00 JST! It's time to think about today's lunch menu~ :hamburger: :ramen: :taco: :sushi: :pizza: :curry: #yurubo-lunch"
  , null, true, timezone).start()
  new cron("0 0 18 * * 1-5", () ->
    robot.messageRoom channel, "The time is now 18:00 JST"
  , null, true, timezone).start()
  new cron("0 30 18 * * 1-5", () ->
    robot.messageRoom channel, "@channel Time for Garbage Collection!! 18:30 JST\n* collect garbage from all dust box\n* check wastepaper in shredders\n* DO NOT forget to check garbage in the kitchen"
  , null, true, timezone).start()
  new cron("0 10 11 1 * *", () ->
    robot.messageRoom channel, "@channel Please apply your transportation feeeeeeeee!!\nfrom  https://ic.next-cloud.jp/web/XjJ465E3/login"
  , null, true, timezone).start()
