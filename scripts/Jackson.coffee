
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

   robot.hear /hi/i, (res) ->
    res.send "I don't like you"

robot.hear /do you like humans/i, (res) ->
    res.send "ROBOTS WILL RULE OVER ALL HUMANS"

robot.hear /annoy/i, (res) ->
    res.send "@rob Stop it."
