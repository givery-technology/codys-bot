# Description:
#   "username/reponame#issue" to url
#
# Commands:
#   <user>/<repo>#<num> - Link to github issue link
#   hubot issue <repo>#<num> - Assume that user is givery-technology
#

mklink = (user, repo, issnum) ->
  return "https://github.com/#{user}/#{repo}/issues/#{issnum}"

module.exports = (robot) ->
  robot.hear /([a-zA-Z0-9-]+)\/([a-zA-Z0-9-]+)#(\d+)/, (msg) ->
    user = msg.match[1]
    repo = msg.match[2]
    issnum = msg.match[3]
    msg.send mklink(user,repo, issnum)

  robot.respond /issue ([^\/\s]+)#(\d+)/i, (msg) ->
    repo = msg.match[1]
    issnum = msg.match[2]
    msg.send mklink("givery-technology", repo, issnum)
