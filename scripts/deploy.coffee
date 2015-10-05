# Description:
#   create pull requests in a Github repository
#
# Dependencies:
#   "githubot": "0.4.x"
#
# Configuration:
#   HUBOT_GITHUB_TOKEN
#
# Commands:
#   hubot deploy <repo_name>/<head> into <base> - create pull request

module.exports = (robot) ->

  github = require("githubot")(robot)

  unless (url_api_base = process.env.HUBOT_GITHUB_API)?
    url_api_base = "https://api.github.com"

  _getDate = ->
    theDate = new Date
    yyyy = theDate.getFullYear()
    mm = theDate.getMonth()+1 #January is 0!
    if mm < 10
      mm = "0" + mm
    dd = theDate.getDate()
    if dd < 10
      dd = "0" + dd
    yyyy + "." + mm + "." + dd

  robot.respond /deploy ([-_\.0-9a-zA-Z]+)(\/([-_\.a-zA-z0-9\/]+))(\/([-_\.a-zA-z0-9\/]+)) into (deployment\/([-_\.a-zA-z0-9\/]+))$/i, (msg)->
    owner = msg.match[1]
    repo = msg.match[3]
    head = msg.match[5] || "master"
    base = msg.match[6]
    environment = msg.match[7]
    makePullRequest msg, owner, repo, head, base, environment

  robot.respond /deploy whale-server/i, (msg)->
    makePullRequest msg, "givery-technology", "whale-env", "master", "deployment/production", "production"

  makePullRequest = (msg, owner, repo, head, base, environment) ->
    body = """
      - Created by #{msg.envelope.user.name} on #{msg.envelope.room} channel
      - Circle CI build status can be shown: https://circleci.com/gh/#{owner}/#{repo}/tree/#{encodeURIComponent(base)}
    """
    data = {
      "title": "#{_getDate()} #{environment} deployment by #{msg.envelope.user.name}"
      "body": body
      "head": head
      "base": base
    }
    url = "repos/#{owner}/#{repo}/pulls"
    robot.logger.debug url
    robot.logger.debug data
    github.handleErrors (response) ->
      robot.logger.debug response
      msg.send JSON.stringify(response)
    github.post url, data, (pull) ->
      robot.logger.debug pull
      msg.send "Created pull request " + pull.html_url
