phteven = [
  "http://i.imgur.com/XjB9OzY.jpg", # rabbit in a hat
  "http://i.imgur.com/w94k4VY.jpg", # dress
  "http://i.imgur.com/NVaZMaU.jpg", # le mis
  "http://i.imgur.com/inWWrMw.jpg", # cartoons
  "http://i.imgur.com/RSsRocL.jpg", # fuck this
  "http://i.imgur.com/Xo3udwh.jpg", # grumpy tardar sauce
  "http://i.imgur.com/FwCAvGH.jpg", # grandma got run over
  "http://i.imgur.com/AZYo4BY.jpg", # double deal with it
  "http://i.imgur.com/YmdGDmS.jpg", # mural
  "http://i.imgur.com/pKsHHUE.jpg", # stahp
  "http://i.imgur.com/soWPJ6l.jpg", # good
  "http://26.media.tumblr.com/tumblr_llkrj8drtj1qe92k5o1_500.gif",
  "http://i.imgur.com/LrtjQo2.jpg", # Tardar Bonepart
  "http://i.imgur.com/nsXFYuV.jpg", # drawing
  "http://i.imgur.com/I8ZJFZR.jpg", # terrible time of the year
  "http://i.imgur.com/ep5IfSP.jpg", # Citizen Kane
]

module.exports = (robot) ->
  robot.hear /phteven/i, (msg) ->
    msg.send phteven[Math.floor(Math.random()*phteven.length)]

  robot.respond /phteven bomb( (\d+))?/i, (msg) ->
    count = msg.match[2] || 5
    for i in [1..count] by 1
      msg.send phteven[Math.floor(Math.random()*phteven.length)]

