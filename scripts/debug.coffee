# Description:
#   Dump some logs for you, see the log.
#

module.exports = (robot) -> 
  robot.respond /debug/, (res) -> 
    robot.logger.info Object.keys(res)
    robot.logger.info res.message
    res.send "Yup, I dump the logs. Take a look into it."

