# Description:
#   Example scripts for you to examine and try out.
#
# Notes:
#   They are commented out by default, because most of them are pretty silly and
#   wouldn't be useful and amusing enough for day to day huboting.
#   Uncomment the ones you want to try and experiment with.
#
#   These are from the scripting documentation: https://github.com/github/hubot/blob/master/docs/scripting.md

module.exports = (robot) ->

   robot.hear /Trump/i, (res) ->
    res.send "DONALD TRUMP IS DEVIL SPAWN!!!"

   robot.hear /Lego/i, (res) ->
    res.send "EVERYTHING IS AWESOME!!!"

   robot.hear /Hi/i, (res) ->
    res.send "Hello"

   robot.hear /waffle/i, (res) ->
    res.send "DO YOU LIKE WAFFLES?! YEA WE LIKE WAFFLES!!! DO YOU LIKE PANKCAKES?! YEA WE LIKE PANCAKES!!!"

   robot.hear /frozen/i, (res) ->
    res.send "LET IT GO!!! LET IT GO!!!"
