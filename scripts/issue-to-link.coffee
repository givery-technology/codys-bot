# Description:
#   "username/reponame#issue" to url
#
# Commands:
#   <user>/<repo>#<num> - Link to github issue link
#

mklink = (user, repo, issue) ->
  return "https://github.com/#{user}/#{repo}/issues/#{issue}"

module.exports = (robot) ->
  robot.hear /(\S+?)\/(\S+?)#(\d+)/, (msg) ->
    user = msg.match[1]
    repo = msg.match[2]
    issue = msg.match[3]
    msg.send mklink(user,repo, issue)

  robot.respond /issue ([^\/\s]+)#(\d+)/i, (msg) ->
    repo = msg.match[1]
    issue = msg.match[2]
    msg.send mklink("givery-technology", repo, issue)
