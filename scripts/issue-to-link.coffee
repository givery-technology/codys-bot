# Description:
#   "username/reponame#issue" to url
#
# Commands:
#   user/repo#num
#

console.log "load issue-to-link"
mklink = (user, repo, issue) -> return "https://github.com/#{user}/#{repo}/issues/#{issue}"

module.exports = (robot) ->
  robot.hear /(\S+?)\/(\S+?)#(\d+)/, (msg) ->
    user = msg.match[1]
    repo = msg.match[2]
    issue = msg.match[3]
    msg.send mklink(user,repo, issue)
