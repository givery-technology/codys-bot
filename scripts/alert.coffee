# Description:
#   Alert any message with `[critical]` in specified channel

channels = [
    "room-takayukioda"
    "watch-incident"
]

module.exports = (robot) -> 
  robot.hear /\[critical]/, (res) -> 
    unless channels.includes res.message.room
      return

    res.send "@channel :name_badge: It seems we are facing an **INCIDENT**. Act fast!! :name_badge:"
