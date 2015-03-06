module.exports = (robot) -> 


  robot.respond /duel between (.*) and (.*)/i, (msg) ->
    target1 = msg.match[1]
    target2 = msg.match[2]
    x = 0
    delay = (time, fn) ->
      setTimeout fn, time 
    message_string =      
    message2 = 
    
    battle = 1
    
    new_line = "\n"
    
    target1 =
      Turn: 0
      Dead: 0
      Name: target1
      Health: Math.floor((Math.random()*55)+15)
      Dmg: Math.floor((Math.random()*20)+5)
      MeatShield: 0
  
    target2 =
      Turn: 1
      Dead: 0
      Name: target2
      Health: Math.floor((Math.random()*55)+15)
      Dmg: Math.floor((Math.random()*20)+5)
      MeatShield: 0
  
    message_string = (target1.Name + " started with " + target1.Health + " health and " + target1.Dmg + " damage!")
    message_string += new_line
    message2 = (target2.Name + " started with " + target2.Health + " health and " + target2.Dmg + " damage!")       
    message_string += message2
    message_string += new_line


    
    BattleScript = (attacktype, attacking_bot, defending_bot) ->
      MeatShieldProbability = Math.floor(Math.random() * 10) + 1
      if MeatShieldProbability is 2
        return (attacking_bot.Name + " tried to attack but " + defending_bot.Name + " used a meat shield and negated all damage!")
      else
        switch attacktype
          when 1
            defending_bot.Health = defending_bot.Health - (attacking_bot.Dmg * 1.5)
            return (attacking_bot.Name + " critically hit " + defending_bot.Name + " for " + (attacking_bot.Dmg * 1.5) + " points of damage. " + defending_bot.Name + " has " + defending_bot.Health + " hitpoints left!")
          when 2
            defending_bot.Health = defending_bot.Health - attacking_bot.Dmg
            return (attacking_bot.Name + " hit " + defending_bot.Name + " for " + (attacking_bot.Dmg) + " points of damage. " + defending_bot.Name + " has " + defending_bot.Health + " hitpoints left!")
          when 3
            defending_bot.Health = defending_bot.Health - attacking_bot.Dmg
            return (attacking_bot.Name + " hit " + defending_bot.Name + " for " + (attacking_bot.Dmg) + " points of damage. " + defending_bot.Name + " has " + defending_bot.Health + " hitpoints left!")        
          when 4
            defending_bot.Health = defending_bot.Health - attacking_bot.Dmg
            return (attacking_bot.Name + " hit " + defending_bot.Name + " for " + (attacking_bot.Dmg) + " points of damage. " + defending_bot.Name + " has " + defending_bot.Health + " hitpoints left!")  
          when 5
            defending_bot.Health = defending_bot.Health - (attacking_bot.Dmg * .5)
            return (attacking_bot.Name + " hit a glancing blow to " + defending_bot.Name + " for " + (attacking_bot.Dmg * .5) + " points of damage. " + defending_bot.Name + " has " + defending_bot.Health + " hitpoints left!")          
          when 6
            chance = Math.floor(Math.random() * 10) + 1
            if chance == 2
              defending_bot.Health = 0
              return (attacking_bot.Name + " has pulled out a giant sword and cut " + defending_bot.Name + "'s head clean off. ")
            else
              return (attacking_bot.Name + " has become paralyzed in fear and lost a round.")          



      
    #Battle Script

   
    delay 1000, ->
      while battle is 1
        #Targets's Turn

        while target2.Turn is 1 and battle isnt 0
          #Write target Attack Script	
          attack_type = Math.floor(Math.random() * 6) + 1              
          message2 = BattleScript attack_type, target2, target1
          message_string += message2
          message_string += new_line          
          target2.Turn = 0
          target1.Turn = 1
          
        #When target1 Dies
        if target1.Health <= 0
          target1.Dead = 1
          battle = 0
          message2 = (target2.Name + " has successfully slain " + target1.Name + ". Three cheers for the victor!")      
          message_string += message2
          msg.send message_string

    
        #When target2 Dies
        if target2.Health <= 0
          target2.Dead = 1
          battle = 0
          message2 = (target1 + " has successfully slain " + target2.Name + ". Three cheers for the victor!")  
          message_string += message2
          msg.send message_string
       
        #target1's turn
        while target1.Turn is 1 and battle isnt 0
    
        #Write target1 Attack Script
          attack_type = Math.floor(Math.random() * 6) + 1    
          message2 = BattleScript attack_type, target1, target2    
          message_string += message2
          message_string += new_line
          target2.Turn = 1
          target1.Turn = 0
      
        #When target1 Dies
        if target1.Health <= 0 and battle isnt 0
          target1.Dead = 1
          battle = 0
          message2 = (target2.Name + " has successfully slain target1. May he rest in peace")    
          message_string += message2
          msg.send message_string          

    
        #When target2 Dies
        if target2.Health <= 0 and battle isnt 0
          target2.Dead = 1
          battle = 0
          message2 = ("target1 has successfully slain " +  target2.Name + ". Three cheers for the victor!")   
          message_string += message2
          msg.send message_string          