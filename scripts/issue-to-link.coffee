# Description:
#   "username/reponame#issue" to url
#
# Commands:
#   <user>/<repo>#<num> - Link to github issue link
#   hubot issue <repo>#<num> - Assume that user is givery-technology
#

# i for issue
# p for pull request
mklink = (user, repo, issnum, type = "i") ->
  t = if type == "i" then "issues" else "pulls"
  return "https://github.com/#{user}/#{repo}/#{t}/#{issnum}"

module.exports = (robot) ->
  robot.hear /(?:^|\s)([a-zA-Z0-9-]+)\/([a-zA-Z0-9-]+)#(\d+)/i, (msg) ->
    user = msg.match[1].toLowerCase()
    repo = msg.match[2].toLowerCase()
    issnum = msg.match[3].toLowerCase()
    msg.send mklink(user,repo, issnum)

  robot.hear /(?:^|\s)(issues?|pr|pull request) ([^\/\s]+)#(\d+)/i, (msg) ->
    type = if msg.match[1] == "issue" then "i" else "p"
    repo = msg.match[2].toLowerCase()
    issnum = msg.match[3].toLowerCase()

    msg.send mklink("givery-technology", repo, issnum, type)
