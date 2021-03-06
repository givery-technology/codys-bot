# Description:
#   Show you projects and related channels
#
# Commands
#   hubot projects

module.exports = (robot) ->
  robot.respond /projects/i, (res) ->
    res.send "We now have #code-project and #life"

  robot.respond /projects code-project/i, (res) ->
    res.send """
      <@code-project> is the main channel for discussion.
      <@log-code-project> is notifications from mainly GitHub and CircleCI
      """

  robot.respond /projects life/i, (res) ->
    res.send """
      <#C|life> is the main channel for discussion.
      <#C|log-life> is notifications from mainly GitHub and CircleCI
      """
