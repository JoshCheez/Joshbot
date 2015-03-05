module.exports = (robot) -> 
  robot.respond /follow (.*)/i, (msg) ->
      target = msg.match[1]
      ID = new Array()
      followersnum = []
      fs = require("fs")
      fileName = "followers.json"
      fs.exists fileName, (exists) ->
        if exists
          fs.stat fileName, (error, stats) ->
             fs.open fileName, "r", (error, fd) ->
              buffer = new Buffer(stats.size)
              fs.read fd, buffer, 0, buffer.length, null, (error, bytesRead, buffer) ->
                followersnum = JSON.parse(buffer)
                console.log(followersnum.data.followers.length)
                x = 0
                while x < followersnum.data.followers.length
                  ID.push followersnum.data.followers[x].id
                  x++
                console.log ID
                fs.appendFile "followers.txt", "\r\n" + ID, (err) ->
                  throw err if err
                  console.log "HI!"
                fs.close fd                
                
  robot.respond /consolidate (.*)/i, (msg) ->
      target = msg.match[1]
      FinalID = new Array()
      FormattedID = new Array()
      singleID = 0
      x = 0
      fs = require("fs")
      fileName = "followers.txt"
      fs.exists fileName, (exists) ->
        if exists
          fs.stat fileName, (error, stats) ->
             fs.open fileName, "r", (error, fd) ->
              buffer = new Buffer(stats.size)
              fs.read fd, buffer, 0, buffer.length, null, (error, bytesRead, buffer) ->
                singleID = buffer.toString("utf8", 0, buffer.length)
                FinalID = singleID.split(",")
                while x < FinalID.length
                  format = "{\"id\": \"1." + FinalID[x] + "\", \"following\": true}"
                  FormattedID.push format
                  x++
                fs.appendFile "Formatted.txt", "\n" + FormattedID, (err) ->
                  throw err if err
                  console.log "DONE"
                fs.close fd
                
                  
                  