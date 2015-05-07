# Description:
#   Joke commands.
#
# Commands:
#   tanzaku <文章> - 短冊メーカー (15文字以内)
#   バカ - codyが怒ります
#   突然の - 死!!!
#   rock! - let's rock!

eastasianwidth = require 'eastasianwidth'

String::connect = (len) ->
  new Array(len + 1).join @toString()

String::toArray = ->
  array = new Array
  for i in [0...@length]
    array.push @charAt(i)
  array

tanzakunize = (string) ->
  tanzaku = [
    "┏┷┓"
    "┃　┃"
  ]
  for value in string.toArray()
    tanzaku.push "┃#{value}┃"

  tanzaku.push "┃　┃"
  tanzaku.push "┗━┛"

  tanzaku.join "\n"

suddennize = (string) ->
  length = Math.floor eastasianwidth.length(string) / 2
  sudden = [
    "＿#{'人'.connect length + 2}＿"
    "＞　#{string}　＜"
    "￣Y#{'^Y'.connect length}￣"
  ]

  sudden.join "\n"

dont_callme_stupid = [
  "バカって言う奴がバカなんだよ！"
  "あ゛？"
  "はいはい"
  "...(・_・)"
  "Goodbye, cruel world."
  suddennize("死ねよ")
  tanzakunize("おまえがな")
  "shut the F**K!!"
]

module.exports = (robot) ->
  robot.respond /(stupid|バカ)$/i, (msg) ->
    msg.send msg.random dont_callme_stupid

  robot.respond /(短冊|tanzaku)\s(.*)$/i, (msg) ->
    message = msg.match[2].replace /^\s+|\s+$/g, ''
    return until message.length

    if message.length >= 16
      msg.send "メッセージは15文字以内でお願いします。 > <"
      return

    msg.send tanzakunize message

  robot.hear /突然の(.*)$/i, (msg) ->
    message = msg.match[1].replace /^\s|\s+$/g, ''
    return until message.length
    msg.send suddennize message

  robot.respond /(let's )?rocks?!*/, (msg) ->
    msg.send ":metal::troll::metal:"
