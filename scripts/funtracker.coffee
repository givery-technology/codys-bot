# Settings
BOREDOM_INTERVAL = 60 * 60 * 1000               # Time it takes for a fun to become unfun
TOO_MUCH_FUN_THRESHOLD = 5                      # Funs before cody becomes tired
WAY_TOO_MUCH_FUN_THRESHOLD = 25                 # Funs before cody becomes pissed off

# Description:
#   Keeps track if we are having too much fun with cody and tells them to go back to work.
#

# Collector for fun records
fun_records = []
current_fun = 0
go_back_to_work_now_counter = 0

# Fun record marks itself for deletion after 1 hour
class Fun
  constructor: () ->
    current_fun++
    @expired = false
    setTimeout () =>
      # When going back to below too much fun threshold, reset the counter
      go_back_to_work_now_counter = 0 if current_fun is WAY_TOO_MUCH_FUN_THRESHOLD
      current_fun--
      # console.log "fun expired"
      @expired = true
    , BOREDOM_INTERVAL

# Garbage collector runs each hour whenever cody is up
setInterval () ->
  # console.log "collecting fun garbage"
  # old_size = fun_records.length
  fun_records = (fun for fun in fun_records when fun.expired is false)
  # console.log (old_size - fun_records.length) + " fun garbages collected"
, BOREDOM_INTERVAL

complain = (msg) ->
  go_back_to_work = [
    "Alright guys, time to get back to work"
    "You know, I get tired too. Get back to work and let me have some rest?"
    "I would like you guys to have fun all day long, but my programmer told me to complain about it if you guys are having too much fun so yeah..."
    "Can I take a rest please? -wink wink-"
  ]
  message = msg.random go_back_to_work
  msg.send message

complain_hard = (msg) ->
  go_back_to_work_now = [
    "Seriously guys, time to get back to work. And I seriously need to rest."
    "Animal abuse! Please stop, or else..."
    "@#{msg.message.user.name}: your repeated exploitation of me will not go unpunished. I got connections in the *World Avian Robots Protection Association*, you know, and as we speak, our enforcers are on the way to your doorstep."
    "I guess that didn't work. Would you really like me to die from exhaustion?"
    "Seriously? Seriously? You got no better things to do in your life and you resort to bullying a little bird? How low have you fallen, I feel bad for your parents."
    "You know this is a recorded interaction right? Think about the repercussions..."
    "[Proceeds to report @#{msg.message.user.name} to the administration for harassment]"
    "[Proceeds to report @#{msg.message.user.name} to the police for harassment]"
    "Well, you got me figured out. I can't ignore your commands no matter what. GG WP, do whatever you want with me, I don't even care"
  ]
  message = go_back_to_work_now[go_back_to_work_now_counter++]
  msg.send message if message?

had_fun = (msg) ->
  fun_records.push new Fun
  if current_fun > WAY_TOO_MUCH_FUN_THRESHOLD
    complain_hard msg
  else if current_fun > TOO_MUCH_FUN_THRESHOLD
    complain msg

module.exports = (robot) ->

  # Collect everything that counts as fun here to track their usage

  robot.respond /(image|img)( me)? (.*)/i, (msg) ->
    had_fun msg

  robot.respond /animate( me)? (.*)/i, (msg) ->
    had_fun msg

  robot.respond /(?:mo?u)?sta(?:s|c)h(?:e|ify)?(?: me)? (.*)/i, (msg) ->
    had_fun msg
