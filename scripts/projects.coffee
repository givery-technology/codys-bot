# ========================================================
#
# This bot is slack hubot in Givery, inc
# botname : cody
# Made by : da0shi
# Description:
#   Show you projects and related channels
#
# ========================================================

module.exports = (robot) ->
  robot.respond /projects/i, (res) ->
    res.send "We now have <#code-project> and <#life>"

  robot.respond /project code-project/i, (res) ->
    res.send """
      <#code-project> is the main channel for discussion.
      <#log-code-project> is notifications from mainly GitHub and CircleCI
      """

  robot.respond /project life/i, (res) ->
    res.send """
      <#C|life> is the main channel for discussion.
      <#C|log-life> is notifications from mainly GitHub and CircleCI
      """
