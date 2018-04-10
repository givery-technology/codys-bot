# Description:
#   Dump some logs for you, see the log.
#

module.exports = (robot) -> 
  robot.respond /debug/, (res) -> 
    robot.logger.info "Keys in res #{Object.keys(res)}"
    robot.logger.info "Keys in res.message #{Object.keys(res.message)}"
    robot.logger.info "res.message.id: #{res.message.id}"
    robot.logger.info "res.message.user.name: #{res.message.user.name}"
    robot.logger.info "res.message.text: #{res.message.text}"
    robot.logger.info "res.message.rawText: #{res.message.rawText}"
    robot.logger.info "res.message.room: #{res.message.room}"
    res.send "Yup, I dump the logs. Take a look into it."
