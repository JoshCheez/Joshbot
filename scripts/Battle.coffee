module.exports = (robot) -> 


  robot.respond /attack (.*)/i, (msg) ->
    target = msg.match[1]    
    x = 0
    delay = (time, fn) ->
      setTimeout fn, time 
    message_string =      
    message2 = 
    
    battle = 1
    
    new_line = "\n"    
    
    JoshBot =
      Turn: 0
      Dead: 0
      Name: "JoshBot"
      Health: Math.floor((Math.random()*55)+15)
      Dmg: Math.floor((Math.random()*20)+5)
      MeatShield: 0
  
    target =
      Turn: 1
      Dead: 0
      Name: target
      Health: Math.floor((Math.random()*55)+15)
      Dmg: Math.floor((Math.random()*20)+5)
      MeatShield: 0
  
    message_string = ("JoshBot started with " + JoshBot.Health + " health and " + JoshBot.Dmg + " damage!")
    message_string += new_line
    message2 = (target.Name + " started with " + target.Health + " health and " + target.Dmg + " damage!")       
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

        while target.Turn is 1 and battle isnt 0
          #Write target Attack Script	
          attack_type = Math.floor(Math.random() * 6) + 1              
          message2 = BattleScript attack_type, target, JoshBot
          message_string += message2
          message_string += new_line          
          target.Turn = 0
          JoshBot.Turn = 1
          
        #When JoshBot Dies
        if JoshBot.Health <= 0
          JoshBot.Dead = 1
          battle = 0
          message2 = (target.Name + " has successfully slain JoshBot. May he rest in peace")      
          message_string += message2
          msg.send message_string

    
        #When target Dies
        if target.Health <= 0
          target.Dead = 1
          battle = 0
          message2 = ("JoshBot has successfully slain " + target.Name + ". Three cheers for the victor!")  
          message_string += message2
          msg.send message_string
       
        #JoshBot's Turn
        while JoshBot.Turn is 1 and battle isnt 0
    
        #Write JoshBot Attack Script
          attack_type = Math.floor(Math.random() * 6) + 1    
          message2 = BattleScript attack_type, JoshBot, target    
          message_string += message2
          message_string += new_line
          target.Turn = 1
          JoshBot.Turn = 0
      
        #When JoshBot Dies
        if JoshBot.Health <= 0 and battle isnt 0
          JoshBot.Dead = 1
          battle = 0
          message2 = (target.Name + " has successfully slain JoshBot. May he rest in peace")    
          message_string += message2
          msg.send message_string          

    
        #When target Dies
        if target.Health <= 0 and battle isnt 0
          target.Dead = 1
          battle = 0
          message2 = ("JoshBot has successfully slain " +  target.Name + ". Three cheers for the victor!")   
          message_string += message2
          msg.send message_string          