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
   robot.hear /pepe/i, (res) ->
      res.send "https://www.google.com/search?q=pepe+wow&espv=2&tbm=isch&imgil=8T8IP0OooooZIM%253A%253Bk-Ryu7tFjnLVaM%253Bhttps%25253A%25252F%25252Ftheduchessofdork.wordpress.com%25252F2015%25252F02%25252F08%25252Fhave-you-worn-the-bird-pepe-pippers-wow-easter-eggs%25252F&source=iu&pf=m&fir=8T8IP0OooooZIM%253A%252Ck-Ryu7tFjnLVaM%252C_&usg=__nhZbuRB8dnsVX-NJvUTb5ycFNY0%3D&biw=1366&bih=667&ved=0ahUKEwiru5XbqrLMAhUHuYMKHRcwDe0QyjcINg&ei=PogiV6ukBYfyjgSX4LToDg#imgrc=8T8IP0OooooZIM%3A"   

   robot.hear /badger/i, (res) ->
     res.send "Badgers? BADGERS? WE DON'T NEED NO STINKIN BADGERS"

   robot.respond /open the (.*) doors/i, (res) ->
     doorType = res.match[1]
     if doorType is "pod bay"
       res.reply "I'm afraid I can't let you do that."
     else
       res.reply "Opening #{doorType} doors"


#============================================

   robot.respond /Who (.*) Ian (.*)/i, (res) ->
      res.send "Ian Kilgore"
      res.send "970-235-1770"
      res.send "ianmacduffkilgore@gmail.com"
      res.send "current location is undisclosable"
      
       #============================================

   robot.hear /I like pie/i, (res) ->
     res.emote "makes a freshly baked pie"

   lulz = ['lol', 'rofl', 'lmao']

   robot.respond /lulz/i, (res) ->
     res.send res.random lulz

   robot.topic (res) ->
     res.send "#{res.message.text}? That's a Paddlin'"


   enterReplies = ['Hi', 'Target Acquired', 'Firing', 'Hello friend.', 'Gotcha', 'I see you']
   leaveReplies = ['Are you still there?', 'Target lost', 'Searching']

   robot.enter (res) ->
     res.send res.random enterReplies
   robot.leave (res) ->
     res.send res.random leaveReplies

   answer = process.env.HUBOT_ANSWER_TO_THE_ULTIMATE_QUESTION_OF_LIFE_THE_UNIVERSE_AND_EVERYTHING

   robot.respond /what is the answer to the ultimate question of life/, (res) ->
     unless answer?
       res.send "Missing HUBOT_ANSWER_TO_THE_ULTIMATE_QUESTION_OF_LIFE_THE_UNIVERSE_AND_EVERYTHING in environment: please set and try again"
       return
     res.send "#{answer}, but what is the question?"

   robot.respond /you are a little slow/, (res) ->
     setTimeout () ->
       res.send "Who you calling 'slow'?"
     , 60 * 1000

   #annoyIntervalId = null

   #robot.respond /screen/, (res) ->
    # if annoyIntervalId
     #  res.send "AAAAAAAAAAAEEEEEEEEEEEEEEEEEEEEEEEEIIIIIIIIHHHHHHHHHH"
      # return
#
 #    res.send "Hey, want to hear the most annoying sound in the world?"
  #   annoyIntervalId = setInterval () ->
   #    res.send "AAAAAAAAAAAEEEEEEEEEEEEEEEEEEEEEEEEIIIIIIIIHHHHHHHHHH"
    # , 1000
#
 #  robot.respond /stop it/, (res) ->
  #   if annoyIntervalId
   #    res.send "GUYS, GUYS, GUYS!"
    #   clearInterval(annoyIntervalId)
     #  annoyIntervalId = null
    # else
   #    res.send "Not annoying you right now, am I?"


   robot.router.post '/hubot/chatsecrets/:room', (req, res) ->
     room   = req.params.room
     data   = JSON.parse req.body.payload
     secret = data.secret

     robot.messageRoom room, "I have a secret: #{secret}"

     res.send 'OK'

   robot.error (err, res) ->
     robot.logger.error "DOES NOT COMPUTE"

     if res?
       res.reply "DOES NOT COMPUTE"

   robot.respond /have a soda/i, (res) ->
     # Get number of sodas had (coerced to a number).
     sodasHad = robot.brain.get('totalSodas') * 1 or 0

     if sodasHad > 4
       res.reply "I'm too fizzy.."

     else
       res.reply 'Sure!'

       robot.brain.set 'totalSodas', sodasHad+1

   robot.respond /sleep it off/i, (res) ->
     robot.brain.set 'totalSodas', 0
     res.reply 'zzzzz'
