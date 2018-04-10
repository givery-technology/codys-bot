# Description:
#   Dump some logs for you, see the log.
#

module.exports = (robot) -> 
  robot.respond /debug/, (res) -> 
    robot.logger.info "Keys in res #{Object.keys(res)}"
    robot.logger.info "Keys in res.message #{Object.keys(res.message)}"
    robot.logger.info "res.id: #{res.id}"
    robot.logger.info "res.user.name: #{res.user.name}"
    robot.logger.info "res.text: #{res.text}"
    robot.logger.info "res.rawText: #{res.rawText}"
    robot.logger.info "res.room: #{res.room}"
    res.send "Yup, I dump the logs. Take a look into it."
