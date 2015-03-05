
module.exports = (robot) -> 

    
  robot.respond /generate 5000 users(.*)/i, (msg) ->
    msg.send "sending"
    url = "test-apiv2-01.cloudapp.net/v2/users"
    client = new XMLHttpRequest()
    client.open "PUT", url, false
    client.setRequestHeader "Content-Type", "text/plain"
    client.send "test"
    msg.send client.status
     
